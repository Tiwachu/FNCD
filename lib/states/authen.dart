import 'package:flutter/material.dart';
import 'package:notim/states/create_new_account.dart';
import 'package:notim/utility/my_constant.dart';
import 'package:notim/widgets/show_buttom.dart';
import 'package:notim/widgets/show_form.dart';
import 'package:notim/widgets/show_image.dart';
import 'package:notim/widgets/show_text.dart';
import 'package:notim/widgets/show_text_buttom.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool redEye = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusScopeNode());
        },
        child: Container(
          decoration: MyConstant().basicBox(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                newHead(),
                newEmail(),
                newPassword(),
                buttomLoin(),
                newCreateAccount()
              ],
            ),
          ),
        ),
      )),
    );
  }

  Row newCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Showtext(text: 'Non Account?'),
        ShowTextButtom(
          label: 'Create Account',
          pressFunction: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateNewAccount(),
                ));
          },
        ),
      ],
    );
  }

  ShowButtom buttomLoin() {
    return ShowButtom(
      label: 'Login',
      pressFunction: () {},
    );
  }

  ShowForm newPassword() {
    return ShowForm(
      hint: 'Password:',
      obsecu: redEye,
      redEyeFunction: () {
        setState(() {
          redEye = !redEye;
        });
      },
    );
  }

  ShowForm newEmail() {
    return ShowForm(
      hint: 'Email:',
      iconData: Icons.drafts,
    );
  }

  SizedBox newHead() {
    return SizedBox(
      width: 250,
      child: Row(
        children: [
          Showtext(
            text: 'Login',
            textStyle: MyConstant().h1Style(),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16),
            width: 48,
            child: const ShowImage(),
          ),
        ],
      ),
    );
  }
}
