
import 'dart:async';

import 'package:flutter/material.dart';

import '../data/task.dart';

class MainProvider extends ChangeNotifier {

  late Task task;
  int pageIndex = 0;
  int pageIndexCount = 0;
  bool isLongPressed = false;
  bool isLoading = true;




void isSelected(value){
  notifyListeners();
  pageIndex = value;

}


  void longPressed() {
    isLongPressed = true;
    notifyListeners();
  }

  void updateTaskList() {
    notifyListeners();
  }

  List<ElevatedButton> listButton(Widget widget, context, String title) {
    return [
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => widget));
          },
          child: Text(title)),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => widget));
          },
          child: Text(title)),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => widget));
          },
          child: Text(title)),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => widget));
          },
          child: Text(title)),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => widget));
          },
          child: Text(title)),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => widget));
          },
          child: Text(title)),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => widget));
          },
          child: Text(title)),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => widget));
          },
          child: Text(title)),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => widget));
          },
          child: Text(title)),
    ];
  }
}
