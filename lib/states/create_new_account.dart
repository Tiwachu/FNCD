import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:notim/utility/my_constant.dart';
import 'package:notim/utility/my_dialog.dart';
import 'package:notim/widgets/show_buttom.dart';
import 'package:notim/widgets/show_form.dart';
import 'package:notim/widgets/show_icon_buttom.dart';
import 'package:notim/widgets/show_image.dart';
import 'package:notim/widgets/show_prograss.dart';
import 'package:notim/widgets/show_text.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({super.key});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  double? lat, lng;

  @override
  void initState() {
    super.initState();
    processFindlocation();
  }

  Future<void> processFindlocation() async {
    LocationPermission locationPermission;

    bool locationServiceEnable = await Geolocator.isLocationServiceEnabled();
    if (locationServiceEnable) {
      // open
      locationPermission = await Geolocator.checkPermission();

      if (locationPermission == LocationPermission.deniedForever) {
        Mydialog(context: context).normolDialog(
          title: 'DenieForver',
          subTitle: 'pleaes Permison Location',
          lable: 'Set permison',
          pressFunc: () {
            Geolocator.openLocationSettings();
            exit(0);
          },
        );
      }

      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();
        if ((locationPermission != LocationPermission.whileInUse) &&
            (locationPermission != LocationPermission.always)) {
          Mydialog(context: context).normolDialog(
            title: 'DenieForver',
            subTitle: 'pleaes Permison Location',
            lable: 'Set permison',
            pressFunc: () {
              Geolocator.openLocationSettings();
              exit(0);
            },
          );
        } else {
          await processLatLng();
        }
      } else {
        await processLatLng();
      }
    } else {
      //closeService
      Mydialog(context: context).normolDialog(
        title: 'Location off',
        subTitle: 'please ON Location Service',
        lable: 'Go to setting',
        pressFunc: () {
          Geolocator.openLocationSettings();
          exit(0);
        },
      );
    }
  }

  Future<void> processLatLng() async {
    var position = await Geolocator.getCurrentPosition();
    lat = position.latitude;
    lng = position.longitude;
    print('lat===> $lat,lng==>>  $lng');
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          ShowIconButtom(
            iconData: Icons.cloud_upload,
            pressFunc: () {},
          )
        ],
        centerTitle: true,
        title: Showtext(
          text: 'Create Account',
          textStyle: MyConstant().h2Style(),
        ),
      ),
      body: ListView(
        children: [
          newAvata(),
          formName(),
          formEmail(),
          formPassword(),
          newMap(),
          buttomCreateAccount(context: context)
        ],
      ),
    );
  }

  ShowButtom buttomCreateAccount({required BuildContext context}) {
    return ShowButtom(
      label: 'Create New Account',
      pressFunction: () {
        // Mydialog(context: context).normolDialog(
        //   title: 'title1234',
        //   subTitle: 'subTitle12345',
        //   lable: 'รู้แล้ว',
        //   pressFunc: () {
        //     print('pressFung ทำงาน');
        //   },
        // );
      },
    );
  }

  Row newMap() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: MyConstant().curveBox(),
          width: 300,
          height: 250,child: lat == null ? const ShowProgress() :Showtext(text: '$lat,$lng'),
        ),
      ],
    );
  }

  Row formPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowForm(
          hint: 'Password',
          iconData: Icons.lock_clock_outlined,
        ),
      ],
    );
  }

  Row formEmail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowForm(
          hint: 'Email',
          iconData: Icons.email_outlined,
        ),
      ],
    );
  }

  Row formName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowForm(
          hint: 'name',
          iconData: Icons.fingerprint,
        ),
      ],
    );
  }

  Container newAvata() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      width: 200,
      height: 200,
      child: ShowImage(
        path: 'images/avata.png',
      ),
    );
  }
}
