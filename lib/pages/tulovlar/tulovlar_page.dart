import 'package:flutter/material.dart';

class TulovlarPage extends StatefulWidget {
  const TulovlarPage({Key? key}) : super(key: key);

  @override
  State<TulovlarPage> createState() => _TulovlarPageState();
}

class _TulovlarPageState extends State<TulovlarPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,

      child: const Center(
        child: Text("To'lovlar", style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
