import 'package:flutter/material.dart';
import 'package:notim/utility/my_constant.dart';

class ShowIconButtom extends StatelessWidget {
  final IconData iconData;
  final Function() pressFunc;
  const ShowIconButtom({
    Key? key,
    required this.iconData,
    required this.pressFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: pressFunc,
      icon: Icon(iconData),color: MyConstant.active,
    );
  }
}
