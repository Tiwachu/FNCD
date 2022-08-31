import 'package:flutter/material.dart';

import 'package:notim/utility/my_constant.dart';
import 'package:notim/widgets/show_icon_buttom.dart';

class ShowForm extends StatelessWidget {
  final String hint;
  final IconData? iconData;
  final bool? obsecu;
  final Function()? redEyeFunction;
  const ShowForm({
    Key? key,
    required this.hint,
    this.iconData,
    this.obsecu,
    this.redEyeFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 250,
      margin: const EdgeInsets.only(top: 16),
      child: TextFormField(
        obscureText: obsecu ?? false,
        style: MyConstant().h3Style(),
        decoration: InputDecoration( fillColor: Colors.white.withOpacity(0.75),
          filled: true,
          suffixIcon: redEyeFunction == null
              ? iconData == null
                  ? const SizedBox()
                  : Icon(
                      iconData,
                      color: MyConstant.dart,
                    )
              : ShowIconButtom(
                  iconData: obsecu!
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined,
                  pressFunc: redEyeFunction!),
          hintStyle: MyConstant().h3GreyStyle(),
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          enabledBorder: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
