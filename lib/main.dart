import 'package:flutter/material.dart';
import 'package:yuksalish_1/pages/home_page.dart';
import 'package:yuksalish_1/pages/shimer_page.dart';
import 'package:yuksalish_1/pages/signin_page.dart';
import 'package:yuksalish_1/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        routes: {
          HomePage.id: (context) => const HomePage(),
          SignUp.id: (context) => const SignUp(),
          SignIn.id: (context) => const SignIn(),
        },
      home: const ShimerPage()


    );
  }
}
