import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:yuksalish_1/model/provider/model_pv.dart';
import 'package:yuksalish_1/pages/home/home_page.dart';
import 'package:yuksalish_1/pages/sign/signup_page.dart';
import 'package:yuksalish_1/pages/splash/shimer_page.dart';
import 'package:yuksalish_1/pages/sign/signin_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

 
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(
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
        debugShowCheckedModeBanner: false,
        title: 'Yuksalish',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        routes: {
          HomePage.id: (context) => const HomePage(),
          SignUp.id: (context) => const SignUp(),
          SignIn.id: (context) => const SignIn(),
        },
        home: const ShimerPage());
  }
}
