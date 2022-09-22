import 'dart:io';
import 'package:flutter/material.dart';
import 'package:notim/bodys/show_body_1.dart';
import 'package:notim/bodys/show_body_2.dart';
import 'package:notim/bodys/show_body_3.dart';
import 'package:notim/utility/my_constant.dart';
import 'package:notim/widgets/My_Singout.dart';
import 'package:notim/widgets/show_icon_buttom.dart';
import 'package:notim/widgets/show_image.dart';
import 'package:notim/widgets/show_text.dart';

class MainMobileUser extends StatefulWidget {
  const MainMobileUser({super.key});

  @override
  State<MainMobileUser> createState() => _MainMobileUserState();
}

class _MainMobileUserState extends State<MainMobileUser> {
  File? file;
  List<Widget> widgets = [ShowBody_1(), ShowBody_2(), ShowBody_3()];
  int indexWeget = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [],
        centerTitle: true,
        title: Showtext(
          text: 'MainUser',
          textStyle: MyConstant().h2Style(),
        ),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            MySingOut(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //ShowDrawerHeader1(),
                BuildDrawerHeader(context),
                menuShow1('Menu1', 'detielMenu1'),
                menuShow2('Menu2', 'detielMenu2'),
                const Divider(
                  color: Colors.black54,
                ),
                menuShow3('Menu3', 'detielMenu3'),
              ],
            )
          ],
        ),
      ),
      body: widgets[indexWeget],
    );
  }

  Widget BuildDrawerHeader(BuildContext context) => Container(
        color: Colors.blue.shade400,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.09,
            bottom: MediaQuery.of(context).size.height * 0.02),
        child: Column(
          children: [
            file == null
                ? ClipOval(
                    child: Image.asset('images/avata.png',width: MediaQuery.of(context).size.width * 1,height: 150,),
                  )
                : CircleAvatar(
                    radius: 52.0,
                    backgroundImage: FileImage(file!),
                  ), 
            Showtext(
              text: 'ชุดที่ 1',
              textStyle: MyConstant().h3Style(),
            ),
            Showtext(
              text: 'ชุดที่ 2',
              textStyle: MyConstant().h3Style(),
            ),
          ],
        ),
      );

  UserAccountsDrawerHeader ShowDrawerHeader1() {
    return UserAccountsDrawerHeader(
      accountName: Text('data'),
      accountEmail: Text('data'),
      currentAccountPicture: CircleAvatar(
        child: ClipOval(
          child: Image.asset(
            'images/avata.png',
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
      ),

      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: NetworkImage(
      //       'https://picpost.postjung.com/175972.html#pic4',
      //     ),fit: BoxFit.cover
      //   ),
      // ),
    );
  }

  ListTile menuShow1(String stringTitle, String stringSubtitle) {
    return ListTile(
      onTap: () {
        print('object==>1');
        setState(() {
          indexWeget = 0;
          Navigator.pop(context);
        });
      },
      leading: Icon(Icons.filter_1),
      title: Showtext(
        text: stringTitle,
        textStyle: MyConstant().h2Style(),
      ),
      subtitle: Showtext(
        text: stringSubtitle,
        textStyle: MyConstant().h3Style(),
      ),
    );
  }

  ListTile menuShow2(String stringTitle, String stringSubtitle) {
    return ListTile(
      onTap: () {
        print('object==>2');
        setState(() {
          indexWeget = 1;
          Navigator.pop(context);
          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowBody_2()));
        });
      },
      leading: Icon(Icons.filter_2),
      title: Showtext(
        text: stringTitle,
        textStyle: MyConstant().h2Style(),
      ),
      subtitle: Showtext(
        text: stringSubtitle,
        textStyle: MyConstant().h3Style(),
      ),
    );
  }

  ListTile menuShow3(String stringTitle, String stringSubtitle) {
    return ListTile(
      onTap: () {
        print('object==>3');
        setState(() {
          indexWeget = 2;
          Navigator.pop(context);
        });
      },
      leading: Icon(Icons.filter_3),
      title: Showtext(
        text: stringTitle,
        textStyle: MyConstant().h2Style(),
      ),
      subtitle: Showtext(
        text: stringSubtitle,
        textStyle: MyConstant().h3Style(),
      ),
    );
  }

  Padding ShowPict() {
    return Padding(
      padding: const EdgeInsets.all(80.0),
      child: file == null
          ? ShowImage(
              path: 'images/avata.png',
            )
          : CircleAvatar(
              radius: 60.0,
              backgroundImage: FileImage(file!),
            ),
    );
  }
}
