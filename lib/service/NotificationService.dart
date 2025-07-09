import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import '../main.dart';
import '../utils/Extensions/StringExtensions.dart';

import '../utils/Constants.dart';

class NotificationService {
  Future<void> sendPushNotifications(String title, String content,
      {String? id, String? image, String? receiverPlayerId}) async {
    log('####$receiverPlayerId!');
    Map req = {
      'headings': {
        'en': title,
      },
      'contents': {
        'en': content,
      },
      'data': {
        'id': 'CHAT_${sharedPref.getInt(USER_ID)}',
      },
      'big_picture': image.validate().isNotEmpty ? image.validate() : '',
      'large_icon': image.validate().isNotEmpty ? image.validate() : '',
      //   'small_icon': mAppIconUrl,
      'app_id': mOneSignalAppIdDriver,
      //    'android_channel_id': mOneSignalChannelID,
      'include_player_ids': [receiverPlayerId],
      'android_group': mAppName,
    };
    var header = {
      HttpHeaders.authorizationHeader: 'Basic $mOneSignalRestKeyDriver',
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    };

    Response res = await post(
      Uri.parse('https://onesignal.com/api/v1/notifications'),
      body: jsonEncode(req),
      headers: header,
    );

    log(res.body);

    if (res.statusCode.isEven) {
    } else {
      throw 'Something Went Wrong';
    }
  }
  // ******** Firebase call statuses *********

  Future<void> initiateCall(String callId) async {
    await FirebaseFirestore.instance.collection('calls').doc(callId).set({
      'status': 'ongoing',
    });
  }

  void listenForCallStatus(
      {required String callId,
      required RtcEngine engine,
      required BuildContext? context}) {
    FirebaseFirestore.instance
        .collection('calls')
        .doc(callId)
        .snapshots()
        .listen((snapshot) async {
      if (snapshot.exists) {
        final data = snapshot.data();
        if (data != null) {
          switch (data['status']) {
            case 'ended':
              // End the call
              await engine.leaveChannel();
              if (kDebugMode) {
                print('Call has ended');
              }
              if (context != null) {
                Navigator.pop(context);
              }
              Fluttertoast.showToast(msg: 'Call has ended');
              FlutterCallkitIncoming.endAllCalls();
              break;
            case 'declined':
              await engine.leaveChannel();
              if (kDebugMode) {
                print('Call has been declined');
              }
              if (context != null) {
                Navigator.pop(context);
              }
              Fluttertoast.showToast(
                  msg: 'Call has declined', backgroundColor: Colors.red);
              break;
          }
        }
      }
    });
  }

  Future<void> endCall({
    required String callId,
    required RtcEngine engine,
  }) async {
    await FirebaseFirestore.instance.collection('calls').doc(callId).update({
      'status': 'ended',
    });
  }

  Future<void> declineCall({required String callId}) async {
    await FirebaseFirestore.instance.collection('calls').doc(callId).update({
      'status': 'declined',
    });
  }
}
// ******** Firebase call statuses end *********
