import 'package:flutter/material.dart';
import 'package:notim/utility/my_constant.dart';
import 'package:notim/widgets/show_buttom.dart';
import 'package:notim/widgets/show_image.dart';
import 'package:notim/widgets/show_text.dart';
import 'package:notim/widgets/show_text_buttom.dart';

class Mydialog {
  final BuildContext context;
  Mydialog({
    required this.context,
  });

  void normolDialog({
    required String title,
    required String subTitle,
    Function()? pressFunc,
    String? lable,
    Function()? pressFunc2,
    String? label2,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: const SizedBox(
            width: 80,
            child: ShowImage(),
          ),
          title: Showtext(
            text: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: Showtext(text: subTitle),
        ),
        actions: [
          label2 == null
              ? const SizedBox()
              : ShowTextButtom(label: label2, pressFunction: pressFunc2!),
          ShowTextButtom(
            label: lable ?? 'OK',
            pressFunction: pressFunc ??
                () {
                  Navigator.pop(context);
                },
          ),
        ],
      ),
    );
  }
}
