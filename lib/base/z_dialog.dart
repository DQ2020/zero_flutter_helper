import 'package:flutter/material.dart';
import 'package:zero_flutter_helper/common/zcolors.dart';

class ZDialog<T> extends StatelessWidget {

  final title;
  final titleTextSize;
  final titleTextColor;
  final message;
  final messageTextSize;
  final messageTextColor;
  final okText;
  final okTextSize;
  final okTextColor;
  final cancelText;
  final cancelTextSize;
  final cancelTextColor;
  final cancelDispose;
  final Function? okEvent;
  final Function? cancelEvent;
  final Widget? child;

  ZDialog({
    required this.title,
    this.titleTextSize = 16.0,
    this.titleTextColor = Colors.black87,
    this.message,
    this.messageTextSize = 14.0,
    this.messageTextColor = Colors.black45,
    this.okText,
    this.okTextSize = 14.0,
    this.okTextColor = Colors.black45,
    this.okEvent,
    this.cancelText,
    this.cancelTextSize = 14.0,
    this.cancelTextColor = Colors.black45,
    this.cancelEvent,
    this.cancelDispose,
    this.child});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 19),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: titleTextSize,
                    color: titleTextColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 19, left: 35, right: 35),
                child: child ?? Text(message??"", style: TextStyle(
                    fontSize: messageTextSize, color: messageTextColor))
            ),
            Container(
              margin: const EdgeInsets.only(top: 14),
              height: 1,
              color: c0xFFEEEEEE,
            ),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  if(!(cancelDispose??false))
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          if (null != cancelEvent) {
                            cancelEvent!();
                          } else{
                            Navigator.of(context).pop();
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            cancelText??"取消",
                            style: TextStyle(
                                fontSize: cancelTextSize, color: cancelTextColor),
                          ),
                        )),
                  ),
                  if(!(cancelDispose??false))
                  Container(
                    width: 1,
                    color: c0xFFEEEEEE,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        if (null != okEvent) {
                          if(child != null) {
                            okEvent!(child);
                          } else{
                            okEvent!();
                          }
                        } else{
                          Navigator.of(context).pop();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          okText??"确定",
                          style: TextStyle(
                              fontSize: 16, color: okTextColor),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

zShowDialog(context, dialog) {
  showDialog(context: context, builder: (context) {
    return dialog!;
  });
}

extension DialogExt on Widget{

  Widget dialog(title,{
    Key? key,
    final message,
    final okText,
    final ngText,
    final okTextSize,
    final okTextColor,
    final ngTextSize,
    final ngTextColor,
    final ngDispose,
    Function? okEvent,
    Function? ngEvent
  }) =>
      ZDialog(title: title,
          message: message,
          okText: okText,
          cancelText: ngText,
          okEvent: okEvent,
          cancelEvent: ngEvent,
          cancelDispose: ngDispose,
          okTextSize:okTextSize,
          okTextColor:okTextColor,
          cancelTextSize:ngTextSize,
          cancelTextColor:ngTextColor,
          child: this);
}