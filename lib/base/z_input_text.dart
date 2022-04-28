import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zero_flutter_helper/common/zcolors.dart';

class ZInputText extends StatelessWidget {

  final String title;
  final String? value;
  final bool? required;
  final GestureTapCallback? onTap;
  final Widget? right;
  final ValueChanged<String>? callback;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? rightIcon;
  final double rightIconPadding;
  final List<int>? limits;

  const ZInputText(this.title,this.callback,{Key? key,this.value,this.required,this.onTap,this.right, this.keyboardType, this.inputFormatters, this.rightIcon, this.limits, this.rightIconPadding = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if(required??false)
          const Positioned(
            child: Text('*',style: TextStyle(color: Colors.redAccent),),left: 12,),
        Positioned(
            child: Text(title),left: 20,),
        Positioned(
          child: right??TextField(
            onTap: onTap,
            inputFormatters: inputFormatters??_limit(),
            keyboardType: keyboardType??TextInputType.text,
            onChanged: callback,
            readOnly: onTap!=null?true:false,
            controller: TextEditingController(text: value??""),
            textAlign: TextAlign.right,
            decoration: InputDecoration(
                hintText: "请输入$title",
                hintStyle: const TextStyle(color: c0xffaaaaaa), //修改颜色
                border: InputBorder.none),
          ).width(200),right: 20 + rightIconPadding,),
        if(rightIcon != null)
          Positioned(child: Image.asset(rightIcon!,width: 10,),right: rightIconPadding,),
        const Positioned(
          child: SizedBox(
            child: Divider(height: 1,),
          ),
        right: 20,
        left: 20,
        bottom: 0,)
      ],
    ).height(50).width(MediaQuery.of(context).size.width);
  }

  List<TextInputFormatter> _limit() {
    List<TextInputFormatter> textInputFormatter = [];
    if(null != limits) {
      for (var element in limits!) {
        switch(element){
          case -1:
            textInputFormatter.add(FilteringTextInputFormatter.digitsOnly);
            break;
          default:
            textInputFormatter.add(LengthLimitingTextInputFormatter(element));
        }
      }
    }
    return textInputFormatter;
  }
}
