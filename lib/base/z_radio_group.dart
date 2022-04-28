import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zero_flutter_helper/widget/style_widget.dart';

class ZRadioGroup extends StatefulWidget {
  var groupValue;
  Item? groupItem;
  List<Item> items;
  Function callback;

  ZRadioGroup(
    this.items,
    this.callback, {
    Key? key,
    this.groupValue,
    this.groupItem,
  }) : super(key: key);

  @override
  _ZRadioGroupState createState() => _ZRadioGroupState();
}

class _ZRadioGroupState extends State<ZRadioGroup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildItemWidget(),
    );
  }

  _buildItemWidget() {
    return widget.items.map((element) {
      return Row(
        children: [
          Radio<String>(
              value: element.id,
              groupValue: widget.groupValue!=null?(widget.groupValue):(widget.groupItem==null?"":widget.groupItem!.value),
              onChanged: (v) {
                setState(() {
                  widget.groupValue = v;
                  widget.groupItem = element;
                });
              }),
          Text(element.value ?? "").width(100).click(onTap: () {
            setState(() {
              widget.groupValue = element.id;
              widget.groupItem = element;
            });
          }),
        ],
      );
    }).toList();
  }
}

class Item {
  var value;
  var id;
}
