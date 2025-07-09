import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

import '../screens/call_screen.dart';
import 'NotificationService.dart';

class IncomingCallService {
  static Future<void> showIncomingCall({
    required String callerName,
    required String channelId,
    required agoraToken,
  }) async {
    String uuid = const Uuid().v4();

    final params = CallKitParams(
      id: uuid,
      nameCaller: callerName,
      appName: 'Your App Name',
      avatar: '',
      handle: 'Caller',
      type: 0, // 0 = audio
      duration: 30000,
      textAccept: 'Accept',
      textDecline: 'Decline',
      extra: {
        'channel_name': channelId,
        'agora_token': agoraToken,
        'caller_name': callerName
      },
    );
    NotificationService().listenForCallStatus(
        callId: channelId, engine: createAgoraRtcEngine(), context: null);
    await FlutterCallkitIncoming.showCallkitIncoming(params);
  }

  static void setupCallkitEventListeners() {
    FlutterCallkitIncoming.onEvent.listen((event) {
      final eventType = event?.event;

      switch (eventType) {
        case Event.actionCallAccept:
          final channelId = event!.body['extra']['channel_name'];
          final agoraToken = event.body['extra']['agora_token'];
          final callerName = event.body['extra']['caller_name'];
          Get.to(() => CallScreen(
                channelId: channelId,
                token: agoraToken,
                callerName: callerName,
              ));
          break;

        case Event.actionCallDecline:
          final callId = event!.body['id'];
          final channelId = event.body['extra']['channel_name'];
          _handleCallDecline(callId, channelId);
          break;

        default:
          print('Unhandled CallKit event: $eventType');
      }
    });
  }

  // static void _handleCallAccept(
  //     String channelId, String token, String callerName) {
  //   print('✅ Call accepted: $channelId');
  //
  // }

  static void _handleCallDecline(String callId, channelId) {
    NotificationService().declineCall(callId: channelId);
    print('❌ Call declined: $callId');
    FlutterCallkitIncoming.endCall(callId);
  }
}
