import 'package:flutter/material.dart';

class SavatchaPage extends StatefulWidget {
  const SavatchaPage({Key? key}) : super(key: key);

  @override
  State<SavatchaPage> createState() => _SavatchaPageState();
}

class _SavatchaPageState extends State<SavatchaPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const Center(
        child: Text("Savatcha", style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
