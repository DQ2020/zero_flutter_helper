import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zero_flutter_helper/zero/widget/style_widget.dart';

class ZAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final Function? action;
  final Function? action2;
  final Function? back;
  final String? backImg;
  final String? actionImg;
  final String? actionImg2;
  final String? actionText;
  final double barHeight;
  final double toolBarHeight;
  final double underBarHeight;
  final dynamic bgImg;

  const ZAppBar(this.title, {Key? key, this.back, this.action, this.action2, this.backImg, this.actionImg, this.actionImg2, this.actionText, this.bgImg,this.barHeight = 50.0,this.toolBarHeight = 0, this.underBarHeight = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(height: 15,),
        Text(title,style: const TextStyle(color: Colors.white),),
        Image.asset(backImg??"image/ic_back.png",width: 30).clickInk(onTap: (){
          if(back == null){
            Navigator.of(context).pop();
          }else{
            back!();
          }
        }).positioned(left: 20),
        if(actionImg !=null)
          Image.asset(actionImg!,width: 30).clickInk(onTap: (){
            action==null?(){
              print("base appbar action is null");
            }():action!();
          }).positioned(right: 20),
        if(actionImg !=null && actionImg2 !=null)
          Image.asset(actionImg2!,width: 30).clickInk(onTap: (){
            action2==null?(){
              print("base appbar action2 is null");
            }():action2!();
          }).positioned(right: 60),
        if(actionText !=null)
          Text(actionText!,style: const TextStyle(color: Colors.white),)
          .clickInk(onTap: (){
            action==null?(){
              print("base appbar action is null");
            }():action!();
          }).positioned(right: 20),
      ],
    ).padding(top: toolBarHeight,bottom: underBarHeight).height(barHeight+toolBarHeight+underBarHeight).width(MediaQuery.of(context).size.width).background(bgImg??Colors.black);
  }

  @override
  Size get preferredSize => Size.fromHeight(barHeight+toolBarHeight+underBarHeight);

}
