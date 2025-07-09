import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/call_controller.dart';

class CallScreen extends StatefulWidget {
  final int? calleeId; // Used when initiating a call
  final String? token; // Used when accepting a call
  final String? channelId;
  final String callerName; // Optional for UI

  const CallScreen({
    super.key,
    this.calleeId,
    this.token,
    this.channelId,
    required this.callerName,
  });

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final CallController controller = Get.put(CallController());
  @override
  void initState() {
    super.initState();

    if (widget.token != null && widget.channelId != null) {
      // Callee accepting call
      controller.initAgora(
        token: widget.token!,
        channelId: widget.channelId!,
        context: context,
        uid: 1, // Make sure it's different from caller
      );
    } else if (widget.calleeId != null) {
      // Caller starting the call
      controller.startCall(calleeId: widget.calleeId!, context: context);
    } else {
      print('⚠️ Missing call parameters');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white12,
                  child: Icon(
                    controller.remoteUid?.value != null
                        ? Icons.person
                        : Icons.person_outline,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  controller.remoteUid?.value != null
                      ? "In call with ${widget.callerName}"
                      : "Calling...",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 10),
                if (controller.callActive.value)
                  Text(
                    formatDuration(controller.callDuration.value),
                    style: const TextStyle(
                        color: Colors.greenAccent, fontSize: 16),
                  ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(
                          controller.muted.value ? Icons.mic_off : Icons.mic),
                      iconSize: 32,
                      color: controller.muted.value
                          ? Colors.redAccent
                          : Colors.white,
                      onPressed: controller.toggleMute,
                    ),
                    IconButton(
                      icon: const Icon(Icons.call_end),
                      iconSize: 48,
                      color: Colors.red,
                      onPressed: controller.endCall,
                    ),
                    IconButton(
                      icon: Icon(controller.speakerOn.value
                          ? Icons.volume_up
                          : Icons.hearing),
                      iconSize: 32,
                      color: Colors.white,
                      onPressed: controller.toggleSpeaker,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            )),
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }
}
