import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yuksalish_1/pages/signin_page.dart';
import 'package:yuksalish_1/pages/signup_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String id = "splash_page";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  var isLogin = false;

  _initTimer(){
    Timer(const Duration(seconds: 4),(){
      if(isLogin){
        Navigator.pushReplacementNamed(context, SignIn.id);
      }else{
        Navigator.pushReplacementNamed(context, SignUp.id);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Center(
              child: Image.asset("assets/images/logo_ic.png", height: 250, width: 350,),
            ),
          ],
        ),
      ),
    );
  }
}
