

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../firebase_services/model_services.dart';

class MainProvider extends ChangeNotifier {
  TextEditingController textController = TextEditingController();
  // late Task task;
  int telefon = 0;
  bool isLoadingKategoriya = false;

  void isLoadingKategoriyaFunction(value){
    isLoadingKategoriya = value;
    notifyListeners();
  }
  Future<List<DocumentSnapshot>> searchList(String field, dynamic value) async {
    final collectionReference = FirebaseFirestore.instance.collection('items');
    final query = collectionReference.where(field, arrayContains: value);

    final snapshot = await query.get();
    final documents = snapshot.docs;

    return documents;
  }

  void delete(CategoryList category,String collection,context) async {
    final FirebaseFirestore fireStore = FirebaseFirestore.instance;
    final FirebaseStorage firebase = FirebaseStorage.instance;
    String result = "";

    for (var item in category.title!.title!.split("")) {
      String compareItem = item;
      item == "/" ? compareItem = "_" : compareItem;
      result = "$result$compareItem";
    }
    try {
      if (kDebugMode) {
        print("kategoriya_$result");
      }
      fireStore
          .collection(collection)
          .doc("kategoriya_$result")
          .delete();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 1500),
          backgroundColor: Colors.redAccent.shade200,
          padding: const EdgeInsets.only(top: 0, bottom: 0),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text("${category.title!.title} o'chirildi"),
            ],
          )));





      if (kDebugMode) {
        print(category.image);
      }
      firebase.refFromURL(category.image ?? "").delete();
      fetcMovies(collection);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  CollectionReference<CategoryList> fetcMovies(String collection) {
    return FirebaseFirestore.instance
        .collection(collection)
        .withConverter<CategoryList>(
      fromFirestore: (snapshots, _) =>
          CategoryList.fromJson(snapshots.data()!),
      toFirestore: (productList, _) => productList.toJson(),
    );
  }


  // void deviceSize(context){
  //   final size = MediaQuery.of(context).size;
  //
  //   notifyListeners();
  // }

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


    // void _create() async {
    //   final FirebaseFirestore firestore = FirebaseFirestore.instance;
    //
    //   try {
    //     await firestore.collection("movies").doc("${name.replaceAll(" ", "_")}_$year").set({
    //       "name" : name,
    //       "genre" : genre,
    //       "year" : year,
    //     });
    //   }catch (e){
    //     print(e);
    //   }
    // }


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
