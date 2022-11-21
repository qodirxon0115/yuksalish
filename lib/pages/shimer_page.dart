import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import 'home_page.dart';

class ShimerPage extends StatefulWidget {
  const ShimerPage({Key? key}) : super(key: key);
  static const String id = "shimer_page";

  @override
  State<ShimerPage> createState() => _ShimerPageState();
}

class _ShimerPageState extends State<ShimerPage> {


  _initTimer(){
    Timer(const Duration(seconds: 2),(){
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> const HomePage()));


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
    return Shimmer(
        duration: const Duration(milliseconds: 800), //Default value
        interval: const Duration(milliseconds: 300), //Default value: Duration(seconds: 0)
        color: Colors.grey, //Default value
        colorOpacity: 0.4, //Default value
        enabled: true, //Default value
        direction: const ShimmerDirection.fromLTRB(),  //Default Value
        child: Container(
            color: Colors.white,
            ));


  }

}
