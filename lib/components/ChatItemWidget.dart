import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utils/Common.dart';
import '../utils/Extensions/StringExtensions.dart';
import '../../main.dart';
import '../../utils/Colors.dart';
import '../../utils/Constants.dart';
import '../../utils/Extensions/ConformationDialog.dart';
import '../../utils/Extensions/app_common.dart';
import '../model/ChatMessageModel.dart';
import '../utils/full_image_view.dart';

class ChatItemWidget extends StatefulWidget {
  final ChatMessageModel? data;

  ChatItemWidget({this.data});

  @override
  _ChatItemWidgetState createState() => _ChatItemWidgetState();
}

class _ChatItemWidgetState extends State<ChatItemWidget> {
  String? images;

  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  Widget build(BuildContext context) {
    String time;

    DateTime date =
        DateTime.fromMicrosecondsSinceEpoch(widget.data!.createdAt! * 1000);
    if (date.day == DateTime.now().day) {
      time = DateFormat('hh:mm a').format(
          DateTime.fromMicrosecondsSinceEpoch(widget.data!.createdAt! * 1000));
    } else {
      time = DateFormat('dd-mm-yyyy hh:mm a').format(
          DateTime.fromMicrosecondsSinceEpoch(widget.data!.createdAt! * 1000));
    }

    Widget chatItem(String? messageTypes) {
      switch (messageTypes) {
        case TEXT:
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: widget.data!.isMe!
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(widget.data!.message!,
                  style: primaryTextStyle(
                      color: widget.data!.isMe!
                          ? Colors.white
                          : textPrimaryColorGlobal),
                  maxLines: null),
              SizedBox(height: 1),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    time,
                    style: primaryTextStyle(
                        color: !widget.data!.isMe.validate()
                            ? Colors.blueGrey.withOpacity(0.6)
                            : Colors.white.withOpacity(0.6),
                        size: 10),
                  ),
                  SizedBox(height: 2),
                  widget.data!.isMe!
                      ? !widget.data!.isMessageRead!
                          ? Icon(Icons.done, size: 12, color: Colors.white60)
                          : Icon(Icons.done_all,
                              size: 12, color: Colors.white60)
                      : Offstage()
                ],
              ),
            ],
          );
        case IMAGE:
          final imageUrl = widget.data!.message.validate();

          return Column(
            crossAxisAlignment: widget.data!.isMe!
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FullImageView(imageUrl: imageUrl),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: radius(16),
                  child: Image.network(
                    imageUrl,
                    width: 250,
                    fit: BoxFit.contain,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: 250,
                        height: 250,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 250,
                      height: 250,
                      color: Colors.grey[300],
                      child: Icon(Icons.broken_image,
                          size: 40, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    time,
                    style: primaryTextStyle(
                      color: !widget.data!.isMe.validate()
                          ? Colors.blueGrey.withOpacity(0.6)
                          : Colors.white.withOpacity(0.6),
                      size: 10,
                    ),
                  ),
                  SizedBox(width: 4),
                  widget.data!.isMe!
                      ? !widget.data!.isMessageRead!
                          ? Icon(Icons.done, size: 14, color: Colors.white60)
                          : Icon(Icons.done_all,
                              size: 14, color: Colors.white60)
                      : Offstage(),
                ],
              ),
            ],
          );
        default:
          return Container();
      }
    }

    EdgeInsetsGeometry customPadding(String? messageTypes) {
      switch (messageTypes) {
        case TEXT:
          return EdgeInsets.symmetric(horizontal: 12, vertical: 8);
        case IMAGE:
          return EdgeInsets.symmetric(horizontal: 4, vertical: 4);
        case VIDEO:
          return EdgeInsets.symmetric(horizontal: 4, vertical: 4);
        case AUDIO:
          return EdgeInsets.symmetric(horizontal: 4, vertical: 4);
        default:
          return EdgeInsets.symmetric(horizontal: 4, vertical: 4);
      }
    }

    return GestureDetector(
      onLongPress: !widget.data!.isMe!
          ? null
          : () async {
              bool? res = await showConfirmDialogCustom(context,
                  positiveText: language.yes,
                  negativeText: language.no,
                  primaryColor: primaryColor,
                  onAccept: (BuildContext context) {});
              if (res ?? false) {
                hideKeyboard(context);
                chatMessageService
                    .deleteSingleMessage(
                        senderId: widget.data!.senderId,
                        receiverId: widget.data!.receiverId!,
                        documentId: widget.data!.id)
                    .then((value) {
                  //
                }).catchError(
                  (e) {
                    log(e.toString());
                  },
                );
              }
            },
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: widget.data!.isMe.validate()
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          mainAxisAlignment: widget.data!.isMe!
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Container(
              margin: widget.data!.isMe.validate()
                  ? EdgeInsets.only(
                      top: 0.0,
                      bottom: 0.0,
                      left:
                          isRTL ? 0 : MediaQuery.of(context).size.width * 0.25,
                      right: 8)
                  : EdgeInsets.only(
                      top: 2.0,
                      bottom: 2.0,
                      left: 8,
                      right:
                          isRTL ? 0 : MediaQuery.of(context).size.width * 0.25),
              padding: customPadding(widget.data!.messageType),
              decoration: BoxDecoration(
                boxShadow: appStore.isDarkMode ? null : defaultBoxShadow(),
                color: widget.data!.isMe.validate()
                    ? primaryColor
                    : scaffoldColorLight,
                borderRadius: widget.data!.isMe.validate()
                    ? BorderRadius.only(
                        bottomLeft: radiusCircular(12),
                        topLeft: radiusCircular(12),
                        bottomRight: radiusCircular(12),
                        topRight: radiusCircular(12))
                    : BorderRadius.only(
                        bottomLeft: radiusCircular(0),
                        topLeft: radiusCircular(12),
                        bottomRight: radiusCircular(12),
                        topRight: radiusCircular(12)),
              ),
              child: chatItem(widget.data!.messageType),
            ),
          ],
        ),
        margin: EdgeInsets.only(top: 2, bottom: 2),
      ),
    );
  }
}
