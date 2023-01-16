

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

  void addProduct(bool showCard, String title,String price,String creditPrice,String collection, _keyTitleForm,_keyPriceForm,_keyCreditePriceForm,context) {
    if (selectedImage.path != "") {
      if (showCard) {
        bool isValidTitle = _keyTitleForm.currentState!.validate();
        if (isValidTitle) {
          _keyTitleForm.currentState!.save();
          create(collection, title, price,creditPrice, context);

          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(milliseconds: 500),
              backgroundColor: Colors.green.shade200,
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Muvaffaqiyatli qo'shdingiz"),
                ],
              )));
        }
      } else {
        bool isValidTitle = _keyTitleForm.currentState!.validate();
        bool isValidPrice = _keyPriceForm.currentState!.validate();
        bool isValidCreditePrice = _keyCreditePriceForm.currentState!.validate();
        if (isValidTitle && isValidPrice && isValidCreditePrice) {
          _keyTitleForm.currentState!.save();
          _keyPriceForm.currentState!.save();
          _keyCreditePriceForm.currentState!.save();
          create(collection, title, price, creditPrice, context);
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(milliseconds: 500),
              backgroundColor: Colors.green.shade200,
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Serverga so'rov yuborildi"),
                ],
              ),
            ),
          );
        }
      }
    }
  }

  void create(String collectionName, String title,String price,String creditPrice,context) async {
    String compareText = title;
    String result = "";

    for (var item in compareText.split("")) {
      String compareItem = item;
      item == "/" ? compareItem = "_" : compareItem;
      result = "$result$compareItem";
    }
    var firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child(collectionName == "" ? "banners" : collectionName)
    /*.child(_selectedImage.path)*/
        .child("$result.jpg");
    final task = firebaseStorageRef.putFile(File(selectedImage.path));
    var downloadUrl = await (await task).ref.getDownloadURL();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    if (kDebugMode) {
      print(title);
    }
    try {

      print(result);
      await firestore
          .collection(
          collectionName == "" ? "catalog" : collectionName)
          .doc("kategoriya_$result")
          .set({
        "title": {"title": title, "price": price, "creditePrice" : creditPrice},
        "image": downloadUrl,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 500),
          backgroundColor: Colors.green.shade200,
          padding: const EdgeInsets.only(top: 0, bottom: 0),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Ma'lumot muvofaqqiyatli qo'shildi"),
            ],
          )));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 500),
          backgroundColor: Colors.green.shade200,
          padding: const EdgeInsets.only(top: 0, bottom: 0),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Nimadir xato ketdi va serverga ma'lumot qo'shilmadi"),
            ],
          )));
      if (kDebugMode) {
        print("Xatolik: $e");
        print(title);
      }
    }
  }

  File selectedImage = File("");

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
        selectedImage = File(image.path);
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
    notifyListeners();
  }


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
}
