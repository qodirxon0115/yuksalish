

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/task.dart';

class MainProvider extends ChangeNotifier{
  // dynamic navigator;
  late Task task;
  int pageIndex = 0;
  bool isLongPressed = false;

  TextEditingController? nameController;
  TextEditingController? dateController;
  // index aniqlash uchun funksiya
  void counter(index){
    pageIndex = index;
    notifyListeners();
  }

  void longPressed(){
    isLongPressed = true;
    notifyListeners();
  }
  void updateTaskList() {
    notifyListeners();
  }


  List<ElevatedButton> listButton(Widget widget,context, String title){
    return  [
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),
      ElevatedButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>widget));}, child: Text(title)),


    ];
     notifyListeners();
  }

}