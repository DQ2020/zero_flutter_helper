library zero_flutter_helper;

import 'package:flutter/material.dart';
import 'package:zero_flutter_helper/com/kd/zero/base/base_app_bar.dart';
import 'package:zero_flutter_helper/com/kd/zero/base/base_input_text.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget{

  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: BaseAppBar("测试标题",bgImg: "image/bg_app_bar2.png",toolBarHeight: 20, underBarHeight: 20,actionImg: "image/ic_filter.png",action: (){
          //todo what you want
        },),
        body: Column(
          children: [
            BaseInputText("名称", (v){
              //todo callback the value that you input
            },value: "LEE",required: true,),
            BaseInputText("年龄", (v){
              //todo callback the value that you input
            },value: "12",)
          ],
        ),
      ),
    );
  }

}