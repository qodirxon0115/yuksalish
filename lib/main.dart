import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuksalish_1/model/provider/model_pv.dart';
import 'package:yuksalish_1/pages/home/home_page.dart';
import 'package:yuksalish_1/pages/sign/signup_page.dart';
import 'package:yuksalish_1/pages/splash/shimer_page.dart';
import 'package:yuksalish_1/pages/sign/signin_page.dart';


void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
