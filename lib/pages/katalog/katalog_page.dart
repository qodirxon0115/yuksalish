import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yuksalish_1/pages/katalog/katalog_item_list/katalog_item_list.dart';

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
    return FirebaseFirestore.instance.collection('movies').withConverter<ProductList>(
      fromFirestore: (snapshots, _) => ProductList.fromJson(snapshots.data()!),
      toFirestore: (productList, _) => productList.toJson(),
    );
  }
  @override
  Widget build(BuildContext context) {

    final moviesRef = FirebaseFirestore.instance
        .collection('catalog')
        .withConverter<ProductList>(
          fromFirestore: (snapshots, _) =>
              ProductList.fromJson(snapshots.data()!),
          toFirestore: (productList, _) => productList.toJson(),
        );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // const SizedBox(
          //   height: 35,
          // ),
          ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 10.0),
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.elliptical(0, 0),
                          topLeft: Radius.elliptical(0, 0),
                        ),
                        color: Colors.indigo.withOpacity(0.3)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Kategoriyalar",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          color: Colors.transparent,
                          height: 45,
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 10),
                          child: AnimSearchBar(
                            // rtl: true,
                            width: 400,
                            textController: textController,
                            onSuffixTap: () {
                              setState(() {
                                textController.clear();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ))),
          StreamBuilder<QuerySnapshot<ProductList>>(
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
                  return const Center(child: CircularProgressIndicator());
                }
                return Expanded(
                  flex: 10,
                  child: ListView.builder(
                      itemCount: snapshot.requireData.size,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.indigo.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          // height: 65,
                          margin: const EdgeInsets.only(
                              top: 5, bottom: 5, right: 12, left: 12),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            // onTap: () {
                            //   if (listTitle[index] == "Telefon va Gadjetlar") {
                            //     Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             const KatalogItemList()));
                            //   } else if (listTitle[index] ==
                            //       "Televizor/Video/Audio") {
                            //   } else if (listTitle[index] ==
                            //       "Maishiy Tehnika") {
                            //   } else if (listTitle[index] ==
                            //       "Kompyuter va orgtexnika") {
                            //   } else if (listTitle[index] ==
                            //       "Oshxona tehnikasi") {
                            //   } else if (listTitle[index] ==
                            //       "Uy va ishxona jihozlari") {}
                            // },
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  snapshot.data!.docs[index].data().title ?? "",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.indigo.withOpacity(0.2),
                                    ),
                                    margin: const EdgeInsets.all(8.0),
                                    child: Image.network(snapshot
                                            .data!.docs[index]
                                            .data()
                                            .image ??
                                        ""),
                                    height: 88,
                                    width: 88),
                                const SizedBox(
                                  width: 12,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => Expanded(
              child: ClipRect(
                  child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: AlertDialog(
                  elevation: 0,
                  backgroundColor: Colors.indigo.shade200.withOpacity(0.3),
                  title: Form(
                    key: _keyDialogForm,
                    child: SizedBox(
                        height: size.height * 0.45,
                        width: size.width * 0.7,
                        child: Column(
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                _getImage();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(),
                                ),
                                height: size.height * 0.15,
                                width: size.width * 0.55,
                                child: _selectedImage.path.isEmpty
                                    ? Icon(Icons.add_a_photo_outlined)
                                    : Image.file(_selectedImage),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                labelText: "Genre",
                              ),
                              validator: (value) {
                                if (value != null) if (value.isEmpty) {
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
                                    addMovie();
                                    saveToStorage();
                                    print(title);
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Qo'shish"),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
              )

                  //     Center(
                  //   child: Container(
                  //     height: size.height * 0.6,
                  //     width: size.width * 0.7,
                  //     decoration: BoxDecoration(
                  //       color: Colors.indigo.shade200,
                  //       borderRadius: BorderRadius.circular(25),
                  //     ),
                  //     child: SizedBox(
                  //       height: size.height * 0.6,
                  //       width: size.width * 0.7,
                  //       child:  Column(
                  //         children: <Widget>[
                  //           TextFormField(
                  //             decoration: const InputDecoration(
                  //               icon: Icon(Icons.ac_unit),
                  //             ),
                  //             maxLength: 8,
                  //             textAlign: TextAlign.center,
                  //             onSaved: (val) {
                  //             },
                  //
                  //
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }


  void _delete(ProductList movie) async {
    final FirebaseFirestore fireStore = FirebaseFirestore.instance;
    try {
      fireStore
          .collection("movies")
          .doc(movie.title!)
          .delete();
      fetcMovies();
    } catch (e) {
      print(e);
    }
  }

  void addMovie() {
    bool isValid = _keyDialogForm.currentState!.validate();

    if (isValid) {
      _keyDialogForm.currentState!.save();
      _create();
    }
  }

  void _create() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore
          .collection("catalog")
          .doc("${title.replaceAll(" ", "_")}_$imageUrl")
          .set({
        "title": title,
        "image": imageUrl,
      });
    } catch (e) {
      print(e);
    }
  }

   File _selectedImage = File("");
  String imageUrl = "";

  Future _getImage() async {
    try {

        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imageTemp = XFile(image.path);
        setState(() =>
        this._selectedImage = File(imageTemp.path));
        print(_selectedImage);

    }on PlatformException catch (e) {
  print("Failed to pick image: $e");

  }}

  Future<void> saveToStorage() async {
    final storageRef = FirebaseStorage.instance.ref();

    final uploadTask = await storageRef
        .child("banners")
        .child("$title.jpg")
        .putFile(_selectedImage);
    imageUrl = await uploadTask.ref.getDownloadURL();
  }

  // List<String> listTitle = [
  //   "Telefon va Gadjetlar",
  //   "Televizor/Video/Audio",
  //   "Maishiy Tehnika",
  //   "Kompyuter va orgtexnika",
  //   "Oshxona tehnikasi",
  //   "Uy va ishxona jihozlari",
  // ];
  // List<String> listImage = [
  //   "assets/images/iphone_14.png",
  //   "assets/images/tv_ic.png",
  //   "assets/images/gas_plita.png",
  //   "assets/images/pc_ic.png",
  //   "assets/images/oshxona_ic.png",
  //   "assets/images/uy_ishxona_ic.png",
  // ];
}
