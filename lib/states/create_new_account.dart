import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notim/utility/my_constant.dart';
import 'package:notim/utility/my_dialog.dart';
import 'package:notim/utility/my_service.dart';
import 'package:notim/widgets/show_buttom.dart';
import 'package:notim/widgets/show_form.dart';
import 'package:notim/widgets/show_google_map.dart';
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
  File? file;
  String? name, email, password;

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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          ShowIconButtom(
            iconData: Icons.cloud_upload,
            pressFunc: () {
              processCreateNewAccount();
            },
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
        processCreateNewAccount();
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
          height: 250,
          child: lat == null
              ? const ShowProgress()
              : ShowGoogleMap(lat: lat!, lng: lng!),
        ),
      ],
    );
  }

  Row formPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowForm(
          changFunc: (p0) {
            password = p0.trim();
          },
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
          changFunc: (p0) {
            email = p0.trim();
          },
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
          changFunc: (p0) {
            name = p0.trim();
          },
          hint: 'name',
          iconData: Icons.fingerprint,
        ),
      ],
    );
  }

  Row newAvata() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          width: 200,
          height: 200,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: file == null
                    ? const ShowImage(
                        path: 'images/avata.png',
                      )
                    : CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(file!),
                      ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: ShowIconButtom(
                  iconData: Icons.add_a_photo,
                  pressFunc: () {
                    Mydialog(context: context).normolDialog(
                      title: 'source imImage',
                      subTitle: 'plese Camera or callery',
                      lable: 'Gallary',
                      pressFunc: () async {
                        Navigator.pop(context);
                        file = await MyService()
                            .processTakePhoto(imageSource: ImageSource.gallery);
                      },
                      label2: 'Camara',
                      pressFunc2: () async {
                        Navigator.pop(context);
                        file = await MyService()
                            .processTakePhoto(imageSource: ImageSource.camera);
                        setState(() {});
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> processCreateNewAccount() async {
    if (file == null) {
      Mydialog(context: context)
          .normolDialog(title: 'No Image', subTitle: 'Please Take Photo');
    } else if ((name?.isEmpty ?? true) ||
        (email?.isEmpty ?? true) ||
        (password?.isEmpty ?? true)) {
      Mydialog(context: context)
          .normolDialog(title: 'มีช่่องว่า', subTitle: 'กรอกทุกช่อง');
    } else {
      //----------------------------------------------------------
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((value) {
        print('CreateAccount complte');
      }).catchError((value) {
        Mydialog(context: context)
            .normolDialog(title: value.code, subTitle: value.message);
      });
      //-----------------------------------------------------------
    }
    ;
  }
}
