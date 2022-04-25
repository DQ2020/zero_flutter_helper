import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

extension StyleWidget on Widget {
  Widget visibility({
    Key? key,
    bool show = true,
  }) =>
      Visibility(
        key: key,
        visible: show,
        maintainSize: false,
        maintainAnimation: false,
        child: this,
      );

  Widget click({
    Key? key,
    VoidCallback? onTap,
  }) =>
      GestureDetector(
        key: key,
        onTap: onTap,
        child: this,
      );

  Widget clickInk({
    Key? key,
    VoidCallback? onTap,
  }) =>
      InkWell(
        key: key,
        onTap: onTap,
        child: this,
      );

  Widget container({
    Key? key,
    EdgeInsetsGeometry? padding,
  }) =>
      Container(
        key: key,
        child: this,
        padding: padding,
      );

  Widget or(bool front, Widget after) {
    return front ? this : after;
  }

  Widget background(dynamic bgImg){
    if(bgImg is Color){
      return backgroundColor(bgImg);
    } else {
      return backgroundImage(DecorationImage(image: AssetImage(bgImg),fit: BoxFit.fill)).backgroundColor(Colors.white);
    }
  }
}
