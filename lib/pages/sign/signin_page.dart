import 'package:flutter/material.dart';
import 'package:yuksalish_1/pages/sign/signup_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String id = "signin_page";

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final fioController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.grey[250],
      body: Column(
        children: [
          Spacer(
            flex: 8,
          ),
          Expanded(
            flex: 2,
            child: const Center(
              child: Text(
                "Xush Kelibsiz!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Expanded(
            child: const Center(
              child: Text(
                "Mavjud hisob qaydnomangizga kiring",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),

          Spacer(
            flex: 3,
          ),

          Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white70),
              child: TextField(

                controller: fioController,
                decoration: InputDecoration(

                    hintText: "F.I.O",
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.person_outline_outlined,
                      color: Colors.grey[400],
                    )),
              ),
            ),


          Spacer(),

          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 50,
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.white70),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Parol",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.lock_open_outlined,
                    color: Colors.grey[400],
                  )),
            ),
          ),

          Spacer(),

          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 15),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Parolni unutdingizmi?",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),

          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              height: 45,
              width: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.indigoAccent,),
              child: TextButton(

                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "KIRISH",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],

                ),
              ),
            ),
          ),

          Spacer(),

          Expanded(
            child: Center(
              child: Text(
                "Quyidagilar bilan ulanig",
                style: TextStyle(color: Colors.grey[400]),
              ),
            ),
          ),
          Spacer(),

          // const SizedBox(
          //   height: 15,
          // ),

          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.indigo,
                    ),
                    child: Center(
                        child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Facebook",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 45,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.red,
                    ),
                    child: Center(
                        child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Google",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          // const SizedBox(height: 20,),

          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Hisobingiz yo'qmi?",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, SignUp.id);
                    },
                    child: const Text(
                      "Ro'yxatdan o'tish",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
