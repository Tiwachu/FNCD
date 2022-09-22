import 'package:flutter/material.dart';
import 'package:notim/states/authen.dart';
import 'package:notim/states/create_new_account.dart';
import 'package:notim/states/main_mobile_user.dart';

final Map<String, WidgetBuilder> map = {
  '/authen':(BuildContext context) => Authen(),
  '/createnewaccount' : (BuildContext context) => CreateNewAccount(),  
  '/MainMobileUser' :(BuildContext context) => MainMobileUser(),
 
};

