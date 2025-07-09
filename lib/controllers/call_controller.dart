// call_controller.dart
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../service/NotificationService.dart';
import '../utils/Constants.dart';

class CallController extends GetxController {
  late RtcEngine _engine;
  final RxnInt? remoteUid = RxnInt();
  final RxBool callActive = false.obs;
  final RxBool muted = false.obs;
  final RxBool speakerOn = true.obs;
  final Rx<Duration> callDuration = Duration.zero.obs;
  Timer? _timer;

  final RxString channelName = ''.obs;
  final RxString agoraToken = ''.obs;

  Future<void> startCall(
      {required int calleeId, required BuildContext context}) async {
    try {
      // 1. Call your backend to get token + channel
      final token = await getTokenFromServer(calleeId: calleeId);
      if (token != null) {
        // 2. Start Agora engine
        NotificationService().initiateCall(channelName.value);
        await initAgora(
            token: agoraToken.value,
            channelId: channelName.value,
            context: context,
            uid: 2);
      }
    } catch (e) {
      print('⚠️ Failed to start call: $e');
    }
  }

  Future<String?> getTokenFromServer({required int calleeId}) async {
    // Get token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? bearerToken = prefs.getString(TOKEN);

    final response = await http.post(
      Uri.parse('${DOMAIN_URL}/api/generate-agora-token'),
      headers: {
        'Authorization': 'Bearer $bearerToken',
        'Accept': 'application/json',
      },
      body: {
        'callee_id': calleeId.toString(),
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      agoraToken.value = data['token'];
      channelName.value = data['channel_name'];
      return agoraToken.value;
    } else {
      print("❌ Error fetching token: ${response.body}");
      return null;
    }
  }

  Future<void> initAgora(
      {required String token,
      required String channelId,
      BuildContext? context,
      required int uid}) async {
    await [Permission.microphone].request();
    channelName.value = channelId;
    _engine = createAgoraRtcEngine();
    await _engine.initialize(RtcEngineContext(
      appId: AGORA_APP_ID,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    ));
    NotificationService().listenForCallStatus(
        callId: channelId, engine: _engine, context: context);
    _engine.registerEventHandler(RtcEngineEventHandler(
      onJoinChannelSuccess: (conn, uid) {
        print('✅ Local user joined: $uid');
      },
      onUserJoined: (conn, rUid, elapsed) {
        remoteUid?.value = rUid;
        callActive.value = true;
        _startTimer();
      },
      onUserOffline: (conn, rUid, reason) {
        remoteUid?.value = null;
        callActive.value = false;
        _stopTimer();
      },
      onLeaveChannel: (conn, stats) {
        _stopTimer();
      },
    ));

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableAudio();
    await _engine.joinChannel(
      token: token,
      channelId: channelId,
      uid: uid,
      options: const ChannelMediaOptions(),
    );
    await _engine.setEnableSpeakerphone(speakerOn.value);
  }

  void toggleMute() {
    muted.value = !muted.value;
    _engine.muteLocalAudioStream(muted.value);
  }

  void toggleSpeaker() {
    speakerOn.value = !speakerOn.value;
    _engine.setEnableSpeakerphone(speakerOn.value);
  }

  void endCall() async {
    _stopTimer();
    NotificationService().endCall(engine: _engine, callId: channelName.value);

    await _engine.leaveChannel();
    await _engine.release();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      callDuration.value = callDuration.value + const Duration(seconds: 1);
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  void onClose() {
    _stopTimer();
    super.onClose();
  }
}
