library zero_flutter_helper;

import 'package:flutter/material.dart';
import 'package:zero_flutter_helper/base/z_app_bar.dart';
import 'package:zero_flutter_helper/base/z_input_text.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget{

  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ZAppBar("测试标题",bgImg: "images/bg_app_bar2.png",toolBarHeight: 20, underBarHeight: 20,actionText: "提交",action: (){
          //todo what you want
        },),
        body: Column(
          children: [
            ZInputText("名称", (v){
              //todo callback the value that you input
            },value: "LEE",required: true,),
            ZInputText("年龄", (v){
              //todo callback the value that you input
            },value: "12",)
          ],
        ),
      ),
    );
  }

}