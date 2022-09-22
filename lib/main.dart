import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notim/states/authen.dart';
import 'package:notim/states/create_new_account.dart';
import 'package:notim/states/main_mobile_user.dart';
import 'package:notim/utility/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Map<String, WidgetBuilder> map = {
  '/Authen': (BuildContext context) => Authen(),
  '/CreateNewAccount': (BuildContext context) => CreateNewAccount(),
  '/MainMobileUser': (BuildContext context) => MainMobileUser(),
};
String? initlalRoute;

Future<void> main() async {
  initlalRoute = MyConstant.routeAuthen;
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? uid = preferences.getString('uid');
  await Firebase.initializeApp().then((value) {
    return runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyConstant.appName,
      home: Authen(),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: MyConstant.dart,
          elevation: 0,
        ),
      ),
      routes: map,
      initialRoute: initlalRoute,
    );
  }
}
