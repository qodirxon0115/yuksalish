
import 'dart:async';

import 'package:flutter/material.dart';

import '../data/task.dart';

class MainProvider extends ChangeNotifier {
  late Task task;

  void deviceSize(context){
    final size = MediaQuery.of(context).size;

    notifyListeners();
  }

  //homeheadbanner widget da carousel da tanlangani aniqlab turuvchi o'zgaruvchi
  int pageIndex = 0;
  //homeheadbanner widget da carousel da tanlangani o'zgartirib turuvchi funksiya

  void isSelected(value){
    notifyListeners();
    pageIndex = value;

  }
  //savatcha page da bo'limni bosilganliginini aniqlovchi o'zgaruvchi
  int pageIndexCount = 0;

  //savatcha page da bo'limni bosilganliginini o'zgartiruvchi funksiya
  void isSelectedIndex(value){
    notifyListeners();
    pageIndexCount = value;

  }

  //ma'lumot kelyotganida kutib turish uchun bool type
  bool isLoading = true;





  //admin panelga o'tish uchun uzoq bosilganmi yoki yo'qligini aniqlovchi bool type
  bool isLongPressed = false;

  //admin panelga o'tish uchun uzoq bosilganmi yoki yo'qligini o'zgarturuvchi funksiya

  void longPressed() {
    isLongPressed = true;
    notifyListeners();
  }

  //UI ni yangilab turuvchi funksiya
  void updateTaskList() {
    notifyListeners();
  }
  //static list demo versiyada
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
