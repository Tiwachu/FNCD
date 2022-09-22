

import 'package:flutter/material.dart';
import 'package:notim/states/authen.dart';
import 'package:notim/utility/my_constant.dart';
import 'package:notim/widgets/show_text.dart';
import 'package:notim/router.dart';

class MySingOut extends StatelessWidget {
  const MySingOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Authen(),
                ));
          },
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.white,
            size: 36,
          ),
          title: Showtext(
            text: 'ออกจากระบบ',
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: Showtext(text: 'ทดสอบ 2',textStyle: MyConstant().h3Style(),),
          tileColor: Color.fromARGB(255, 240, 109, 196),
        ),
      ],
    );
  }
}
