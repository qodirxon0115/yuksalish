import 'package:flutter/material.dart';
import 'package:yuksalish_1/pages/sign/signin_page.dart';
import '../../model/user_model.dart';
import '../../service/get_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const String id = "signup_page";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final fioController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();
  final conPassController = TextEditingController();


  Future<void> _doLogin() async {
    String name = fioController.text.toString().trim();
    String address = addressController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    String password = passController.text.toString().trim();
    String conPass = conPassController.text.toString().trim();

    var user = User(name: name, address: address,
        password: password, conPass: conPass, phone: phone);

    GetService.storeUser(user);

    final  user2 = GetService.loadUser();

    print(user2.name);
    print(user2.password);

    Navigator.pushNamed(context, SignIn.id);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 30),
                height: 25,
                child:
                // IconButton(
                //   icon: const
                  const Icon(Icons.arrow_back_outlined),
                  // onPressed: () {
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) => const HomePage()));
                  // },
                // ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
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
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Ma'lumotlarni kiriting!",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 55,
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white70,
            ),
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
          const SizedBox(
            height: 15,
          ),
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
          const SizedBox(
            height: 15,
          ),
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
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 55,
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white70,
            ),
            child: TextField(
              controller: passController,
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
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 55,
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white70,
            ),
            child: TextField(
              controller: conPassController,
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
          const SizedBox(
            height: 35,
          ),
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
                onPressed: _doLogin,
                child: const Text(
                  "Yarating",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
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
    );
  }
}
