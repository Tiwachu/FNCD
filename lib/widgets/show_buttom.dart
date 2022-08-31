import 'package:flutter/material.dart';
import 'package:notim/utility/my_constant.dart';
import 'package:notim/widgets/show_text.dart';

class ShowButtom extends StatelessWidget {
  final String label;
  final Function() pressFunction;
  const ShowButtom({
    Key? key,
    required this.label,
    required this.pressFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: 250,
      child: ElevatedButton(
        onPressed: pressFunction,
        child: Showtext(
          text: label,
          textStyle: MyConstant().h3WhiteStyle(),
        ),
      ),
    );
  }
}
