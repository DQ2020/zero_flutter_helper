import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zero_flutter_helper/base/z_app_bar.dart';
import 'package:zero_flutter_helper/base/z_dialog.dart';
import 'package:zero_flutter_helper/base/z_input_text.dart';
import 'package:zero_flutter_helper/base/z_radio_group.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('zh', 'CN'),
          Locale('en', 'US'),
        ],
        home: const MainPager());
  }
}

class MainPager extends StatefulWidget {
  const MainPager({Key? key}) : super(key: key);

  @override
  _MainPagerState createState() => _MainPagerState();
}

class _MainPagerState extends State<MainPager> {
  var id = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZAppBar(
        "测试标题",
        bgImg: "images/bg_app_bar2.png",
        toolBarHeight: 20,
        underBarHeight: 20,
        actionText: "提交",
        action: () {
          //todo what you want
        },
      ),
      body: Column(
        children: [
          ZInputText(
            "名称",
            (v) {
              //todo callback the value that you input
            },
            value: "LEE",
            required: true,
          ),
          ZInputText(
            "年龄",
            (v) {
              //todo callback the value that you input
            },
            value: "12",
            keyboardType: TextInputType.number,
            limits: const [-1,500],
          ),
          ZInputText(
            "性别",
            (v) {
              //todo callback the value that you input
            },
            value: "男",
            onTap: () {
              zShowDialog(
                  context,
                  ZDialog(
                    title: "请选择",
                    child: ZRadioGroup(
                      [
                        Item()
                          ..value = "男"
                          ..id = "1",
                        Item()
                          ..value = "女"
                          ..id = "0"
                      ],
                      (v) {
                      },
                      groupValue: "1",
                    ),
                    okEvent: (radioGroup) {
                      Navigator.of(context).pop();
                    },
                  ));
            },
            rightIcon: "images/ic_arrow_right.png",
            rightIconPadding: 20,
          ),
        ],
      ),
    );
  }
}
