import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yuksalish_1/pages/splash/splash_page.dart';


class ShimerPage extends StatefulWidget {
  const ShimerPage({Key? key}) : super(key: key);
  static const String id = "splash_page";

  @override
  State<ShimerPage> createState() => _ShimerPageState();
}

class _ShimerPageState extends State<ShimerPage> {


  _initTimer(){
    Timer( const Duration(seconds: 3),(){

     Navigator.of(context).pushReplacement(MaterialPageRoute(
         builder: (BuildContext context)=> const SplashPage()));


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
    return  Scaffold(
      body: Center(
        child: Lottie.asset("assets/json_ic/hi_ic.json")
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   return Shimmer(
  //       duration: const Duration(milliseconds: 800), //Default value
  //       interval: const Duration(milliseconds: 300), //Default value: Duration(seconds: 0)
  //       color: Colors.grey, //Default value
  //       colorOpacity: 0.4, //Default value
  //       enabled: true, //Default value
  //       direction: const ShimmerDirection.fromLTRB(),  //Default Value
  //       child: Container(
  //         color: Colors.white,
  //       ));
  //
  //
  // }

}
