import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:yuksalish_1/pages/katalog/katalog_appBar/katalog_appbar.dart';

import '../../model/firebase_services/model_services.dart';

class KatalogPage extends StatefulWidget {
  const KatalogPage({Key? key}) : super(key: key);

  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  TextEditingController textController = TextEditingController();
  final GlobalKey<FormState> _keyDialogForm = new GlobalKey<FormState>();
  String title = "";

  CollectionReference<ProductList> fetcMovies() {
    return FirebaseFirestore.instance
        .collection('catalog')
        .withConverter<ProductList>(
      fromFirestore: (snapshots, _) =>
          ProductList.fromJson(snapshots.data()!),
      toFirestore: (productList, _) => productList.toJson(),
    );
  }

  bool isLoading = false;
  bool isLoadingPage = false;
  int count = 0;
  bool validImage = false;
  Widget widget1 = Center(
    child: Text("Ma'lumot hali qo'shilmagan"),
  );
  var itemReqruid;
  File imageUrl = File("");


  @override
  Widget build(BuildContext context) {
    final moviesRef = FirebaseFirestore.instance
        .collection('catalog')
        .withConverter<ProductList>(
      fromFirestore: (snapshots, _) =>
          ProductList.fromJson(snapshots.data()!),
      toFirestore: (productList, _) => productList.toJson(),
    );
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // const SizedBox(
          //   height: 35,
          // ),
          KatalogAppBar(),
          StatefulBuilder(builder: (context, setState) {
            return StreamBuilder<QuerySnapshot<ProductList>>(
                stream: moviesRef.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                      ),
                    );
                  }

                  if (!snapshot.hasData) {
                    return Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.requireData.docs.isEmpty) {
                    Timer(Duration(seconds: 3), () {
                      setState(() {
                        isLoading = true;
                      });
                    });
                    return !isLoading
                        ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SpinKitFadingFour(color: Colors.indigo,)
                        ],
                      ),
                    )
                        : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Ma'lumot hali qo'shilmagan!",
                              style: TextStyle(
                                  color: Colors.indigo.shade200,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Expanded(
                      flex: 10,
                      child: RefreshIndicator(
                        onRefresh: () async {


                        },
                        child: ListView.builder(

                            itemCount: snapshot.requireData.size,
                            itemBuilder: (BuildContext context, int index) {
                              final item = snapshot.data!.docs[index].data();
                              itemReqruid = item;
                              if(isLoadingPage) {
                                Center(
                                child: Text(
                                  "Ma'lumot hali!",
                                  style: TextStyle(
                                      color: Colors.indigo.shade200,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ) ;
                              }
                              return snapshot.data?.docs[index]
                                  .data()
                                  .image != ""
                                  ? Dismissible(
                                resizeDuration: Duration(milliseconds: 350),
                                movementDuration:
                                Duration(milliseconds: 500),
                                key: ObjectKey(item.title),
                                background: Container(
                                  color: Colors.green,
                                ),
                                secondaryBackground: Container(
                                  color: Colors.red,
                                ),
                                onDismissed: (value) {
                                  setState(() {
                                    _delete(item);
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                      duration:
                                      Duration(milliseconds: 500),
                                      backgroundColor:
                                      Colors.red.shade200,
                                      padding: EdgeInsets.only(
                                          top: 0, bottom: 0),
                                      content: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              "${item.title} o'chirildi")
                                        ],
                                      )));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.indigo.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  // height: 65,
                                  margin: const EdgeInsets.only(
                                      top: 5,
                                      bottom: 5,
                                      right: 12,
                                      left: 12),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          snapshot.data!.docs[index]
                                              .data()
                                              .title ??
                                              "",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const Spacer(),
                                        Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(50),
                                              color: Colors.indigo
                                                  .withOpacity(0.2),
                                            ),
                                            margin:
                                            const EdgeInsets.all(8.0),
                                            height: 88,
                                            width: 88,
                                            child: FadeInImage(
                                              image: NetworkImage(snapshot
                                                  .data!.docs[index]
                                                  .data()
                                                  .image ??
                                                  ""),
                                              placeholderFit:
                                              BoxFit.fitHeight,
                                              placeholder: AssetImage(
                                                "assets/images/icons/picture_ic.png",
                                              ),
                                            )),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                      ],
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              )
                                  : Container(
                                decoration: BoxDecoration(
                                  color: Colors.indigo.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                height: 75,
                                margin: const EdgeInsets.only(
                                    top: 5, bottom: 5, right: 12, left: 12),
                                child: InkWell(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Shimmer(
                                        color: Colors.indigo,
                                        child: Container()),
                                  ),
                                ),
                              );
                            }),
                      ),
                    );
                  }
                });
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) =>
                  StatefulBuilder(builder: (context, setState) {
                    return ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: AlertDialog(
                            elevation: 0,
                            backgroundColor:
                            Colors.indigo.shade200.withOpacity(0.3),
                            title: Column(
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {
                                    setState(() {
                                      _getImage().whenComplete(() =>
                                          setState(
                                                  () =>
                                              _selectedImage = _selectedImage));
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
                                        : Icon(
                                      Icons.add_a_photo_outlined,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Form(
                                  key: _keyDialogForm,
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
                                              if (value != null) if (value
                                                  .isEmpty) {
                                                return "To'ldirilmagan";
                                              }
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
                                                  addProduct(itemReqruid);
                                                  _create();
                                                  // _getImage();
                                                  print(title);
                                                },
                                                child: const Text("Qo'shish"),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ));
                  }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _delete(ProductList category) async {
    final FirebaseFirestore fireStore = FirebaseFirestore.instance;
    final FirebaseStorage firebase = FirebaseStorage.instance;
    try {
      print("kategoriya_${category.title}");
      fireStore
          .collection("catalog")
          .doc("kategoriya_${category.title}")
          .delete();
      print(category.image);
      firebase.refFromURL(category.image ?? "").delete();
      fetcMovies();
    } catch (e) {
      print(e);
    }
  }

  void addProduct(item) {
    if (_selectedImage.path != "") {
      bool isValid = _keyDialogForm.currentState!.validate();

      if (isValid) {
        _keyDialogForm.currentState!.save();
        _create();
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(milliseconds: 500),
            backgroundColor: Colors.green.shade200,
            padding: EdgeInsets.only(top: 0, bottom: 0),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Muvaffaqiyatli qo'shdingiz"),
              ],
            )));
      }
    }
  }

  void _create() async {
    setState(() {
      isLoading = true;
    });

    var firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('banners')
    /*.child(_selectedImage.path)*/
        .child('$title.jpg');
    final task = firebaseStorageRef.putFile(File(_selectedImage.path));
    var downloadUrl = await (await task).ref.getDownloadURL();
    print('this is url $downloadUrl');
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection("catalog").doc("kategoriya_$title").set({
        "title": title,
        "image": downloadUrl,
      });
    } catch (e) {
      print("Xatolik: $e");
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
      print('No image selected.');
    }
  }
}
