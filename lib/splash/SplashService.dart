import 'dart:async';

import 'package:coffeeshop/screens/startpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../screens/Home.dart';

class SplashService{
  final _auth = FirebaseAuth.instance;

  splash(){
    if(_auth.currentUser!=null)
      {
        Timer(const Duration(seconds: 4),()=>Get.off(()=>Home(),transition: Transition.cupertino));
      }
    else
    {
      Timer(const Duration(seconds: 4),()=>Get.off(()=>StartPage(),transition: Transition.cupertino));
    }
  }

}