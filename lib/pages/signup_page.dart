import 'package:flutter/material.dart';
import 'package:yuksalish_1/model/user_model.dart';
import 'package:yuksalish_1/pages/signin_page.dart';
import 'package:yuksalish_1/service/pref_service.dart';

import 'home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const String id = "signup_page";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final password1Controller = TextEditingController();

  void _doSignUp(){
    String name = nameController.text.toString().trim();
    String address = addressController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String password1 = password1Controller.text.toString().trim();

    User user = User.from(name: name, address: address,
        phone: phone, password: password, password1: password1);

    Prefs.storeUser(user);

    Prefs.loadUser().then((user) => {
      print("malumot saqlani"),
    });

    if(user != null){
      Navigator.pushReplacementNamed(context, HomePage.id);
    }else{
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 30),
                    height: 25,
                    child:
                    const Icon(Icons.arrow_back_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 30,),
              Column(
                children: const [
                  Center(
                    child: Text(
                      "Qani Boshladik!",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: Text(
                      "Ma'lumotlarni kiriting!",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 55,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white70,
                ),
                child: TextField(
                  controller: nameController,
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
              const SizedBox(height: 15,),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 55,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25), color: Colors.white70),
                child: TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: "Address",
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.home_outlined,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 55,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white70,
                ),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: "Telefon raqami",
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.phone_android_outlined,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 55,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white70,
                ),
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
              const SizedBox(height: 15,),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 55,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white70,
                ),
                child: TextField(
                  controller: password1Controller,
                  decoration: InputDecoration(
                      hintText: "Parolni qaytaring",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.lock_open_outlined,
                        color: Colors.grey[400],
                      )),
                ),
              ),
              const SizedBox(height: 35,),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                height: 45,
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.indigoAccent,
                ),
                child: Center(
                  child: TextButton(
                    onPressed:  _doSignUp,
                    child: const Text(
                      "Yarating",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Hisobingiz bormi?",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, SignIn.id);
                      },
                      child: const Text(
                        "Bu yerga o'ting!",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
