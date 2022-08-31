import 'package:flutter/material.dart';
import 'package:notim/utility/my_constant.dart';
import 'package:notim/widgets/show_text.dart';

class ShowTextButtom extends StatelessWidget {
  final String label;
  final Function() pressFunction;
  const ShowTextButtom({
    Key? key,
    required this.label,
    required this.pressFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: pressFunction,
      child: Showtext(
        text: label,
        textStyle: MyConstant().h3ActiveStyle(),
      ),
    );
  }
}
