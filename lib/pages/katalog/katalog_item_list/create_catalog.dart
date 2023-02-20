import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yuksalish_1/model/firebase_services/model_services.dart';

class FloatingButtonActionCategoriya extends StatefulWidget {
  final bool showCard;
  final String collectionName;

  const FloatingButtonActionCategoriya(
      {Key? key, required this.collectionName, required this.showCard})
      : super(key: key);

  @override
  State<FloatingButtonActionCategoriya> createState() =>
      _FloatingButtonActionCategoriyaState();
}

class _FloatingButtonActionCategoriyaState
    extends State<FloatingButtonActionCategoriya> {
  TextEditingController textController = TextEditingController();
  final GlobalKey<FormState> _keyTitleForm = GlobalKey<FormState>();
  final GlobalKey<FormState> _keyPriceForm = GlobalKey<FormState>();

  int count = 0;
  bool validImage = false;
  String title = "";
  String price = "";
  File imageUrl = File("");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FloatingActionButton(
      onPressed: () {
        // final FirebaseFirestore fireStore = FirebaseFirestore.instance.collectionGroup("/").firestore;
        // print(fireStore);

        showDialog(
          context: context,
          builder: (BuildContext context) =>
              StatefulBuilder(builder: (context, setState) {
            return ClipRect(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: AlertDialog(
                elevation: 0,
                backgroundColor: !widget.showCard
                    ? Colors.indigo.shade200.withOpacity(0.3)
                    : Colors.transparent,
                title: !widget.showCard
                    ? Column(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              setState(() {
                                _getImage().whenComplete(() => setState(
                                    () => _selectedImage = _selectedImage));
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color:
                                        validImage ? Colors.red : Colors.black),
                              ),
                              height: size.height * 0.15,
                              width: size.width * 0.55,
                              child: _selectedImage.path != ""
                                  ? FadeInImage(
                                      image: FileImage(_selectedImage),
                                      placeholderFit: BoxFit.fitHeight,
                                      placeholder: const AssetImage(
                                        "assets/images/icons/picture_ic.png",
                                      ),
                                    )
                                  : const Icon(
                                      Icons.add_a_photo_outlined,
                                      size: 35,),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Form(
                            key: _keyTitleForm,
                            child: SizedBox(
                                height: size.height * 0.25,
                                width: size.width * 0.7,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        labelText: "Nomi",
                                      ),
                                      validator: (value) {
                                        if (value != null && value.isEmpty) {
                                          return "To'ldirilmagan";
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        title = value!;
                                      },
                                    ),
                                    Column(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              if (count == 1) {
                                                _selectedImage.path != ""
                                                    ? validImage = true
                                                    : validImage = false;
                                              }
                                            });
                                            addProduct();
                                            _create();
                                            // _getImage();
                                          },
                                          child: const Text("Qo'shish"),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      )
                    : Container(
                        width: size.width * 0.9,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(25)),
                        child: SizedBox(
                            height: size.height * 0.45,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * 0.1,
                                  child: Form(
                                    key: _keyTitleForm,
                                    child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        labelText: "Nomi",
                                      ),
                                      validator: (value) {
                                        if (value != null && value.isEmpty) {
                                          return "To'ldirilmagan";
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        title = value!;
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.15,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () {
                                      setState(() {
                                        _getImage().whenComplete(() => setState(
                                            () => _selectedImage =
                                                _selectedImage));
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: validImage
                                                ? Colors.red
                                                : Colors.black),
                                      ),
                                      height: size.height * 0.15,
                                      width: size.width * 0.55,
                                      child: _selectedImage.path != ""
                                          ? FadeInImage(
                                              image: FileImage(_selectedImage),
                                              placeholderFit: BoxFit.fitHeight,
                                              placeholder: const AssetImage(
                                                "assets/images/icons/picture_ic.png",
                                              ),
                                            )
                                          : const Icon(
                                              Icons.add_a_photo_outlined,
                                              size: 35,
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  height: size.height * 0.1,
                                  child: Form(
                                    key: _keyPriceForm,
                                    child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        labelText: "Narxi",
                                      ),
                                      validator: (value) {
                                        if (value != null && value.isEmpty) {
                                          return "To'ldirilmagan";
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        price = value!;
                                      },
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (count == 1) {
                                            _selectedImage.path != ""
                                                ? validImage = true
                                                : validImage = false;
                                          }
                                        });
                                        addProduct();
                                        _create();

                                        // _getImage();
                                      },
                                      child: const Text("Qo'shish"),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    )
                                  ],
                                ),
                              ],
                            )),
                      ),
              ),
            ));
          }),
        ).whenComplete(() => setState(() {
              _selectedImage = File("");
            }));
      },
      child: const Icon(Icons.add),
    );
  }

  void addProduct() {
    if (_selectedImage.path != "") {
      if (!widget.showCard) {
        bool isValidTitle = _keyTitleForm.currentState!.validate();
        if (isValidTitle) {
          _keyTitleForm.currentState!.save();
          _create();
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
        if (isValidTitle && isValidPrice) {
          _keyTitleForm.currentState!.save();
          _keyPriceForm.currentState!.save();
          _create();
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

  // late final DocumentReference<ProductList> reference;

  void _create() async {
    String compareText = title;
    String result = "";

    for (var item in compareText.split("")) {
      String compareItem = item;
      item == "/" ? compareItem = "_" : compareItem;
      result = "$result$compareItem";
    }
    var firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child(widget.collectionName == "" ? "banners" : widget.collectionName)
        /*.child(_selectedImage.path)*/
        .child("$result.jpg");
    final task = firebaseStorageRef.putFile(File(_selectedImage.path));
    var downloadUrl = await (await task).ref.getDownloadURL();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    if (kDebugMode) {
      print(title);
    }
    try {

      print(result);
      await firestore
          .collection(
              widget.collectionName == "" ? "catalog" : widget.collectionName)
          .doc("kategoriya_$result")
          .set({
        "title": {"title": title, "price": price},
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

  File _selectedImage = File("");

  Future _getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
        imageUrl = _selectedImage;
      });
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
  }
}
