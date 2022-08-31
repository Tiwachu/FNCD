import 'package:flutter/material.dart';
import 'package:notim/utility/my_constant.dart';

class Showtext extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  const Showtext({
    Key? key,
    required this.text,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: textStyle ?? MyConstant().h3Style(),);
  }
}
