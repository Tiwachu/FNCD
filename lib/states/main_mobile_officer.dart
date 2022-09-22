import 'package:flutter/material.dart';
import 'package:notim/utility/my_constant.dart';
import 'package:notim/widgets/show_text.dart';

class MainMobileOfficer extends StatelessWidget {
  const MainMobileOfficer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Showtext(
          text: 'MainOfficer',
          textStyle: MyConstant().h2Style(),
        ),
      ),
    );
  }
}
