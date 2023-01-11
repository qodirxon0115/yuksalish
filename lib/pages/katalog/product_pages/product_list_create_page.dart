import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yuksalish_1/pages/admin_pages/admin_panel_home.dart';
import 'package:yuksalish_1/pages/katalog/katalog_appBar/katalog_appbar.dart';
import 'package:yuksalish_1/pages/katalog/katalog_item_list/create_catalog.dart';

import '../../../model/firebase_services/model_services.dart';

class CreateProduct extends StatefulWidget {
  final String kategoriya;
  const CreateProduct({Key? key, required this.kategoriya}) : super(key: key);

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  @override
  Widget build(BuildContext context) {

    double _childAspectRatio = 0.61;

    final moviesRef = FirebaseFirestore.instance
        .collection(widget.kategoriya)
        .withConverter<CategoryList>(
      fromFirestore: (snapshots, _) =>
          CategoryList.fromJson(snapshots.data()!),
      toFirestore: (productList, _) => productList.toJson(),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
KatalogAppBar(title: widget.kategoriya, isActiveBack: true,),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder<QuerySnapshot<CategoryList>>(

              stream: moviesRef.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }

                if (!snapshot.hasData) {
                  return const Center(child: SpinKitFadingFour(
                    color: Colors.indigo,
                  ));
                }

                return ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: GridView.builder(

                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: _childAspectRatio,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 15,
                    ),
                    itemCount: snapshot.requireData.size,
                    padding: const EdgeInsets.only(bottom: 10, left: 10,top: 15,right: 10),
                    itemBuilder: (context, index) {
                      return Card(
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        color: Colors.white,
                        shadowColor: Colors.grey.shade50,
                        elevation: 12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                        "${snapshot.data!.docs[index].data().title!.title}",
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(

                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(

                                  color: Color(0xffCFECEC),
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffF0F8FF).withOpacity(0.9),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(0, 5), // changes x,y position of shadow
                                    ),
                                  ],
                                ),
                                width: double.infinity,
                                height: double.infinity,
                                child:  FadeInImage(
                                  image: NetworkImage(snapshot
                                      .data!.docs[index]
                                      .data()
                                      .image ??
                                      ""),
                                  placeholderFit:
                                  BoxFit.fitHeight,
                                  placeholder: const AssetImage(
                                    "assets/images/icons/picture_ic.png",
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data!.docs[index].data().title!.price ?? "",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.redAccent),
                                      ),
                                      const Text(
                                        " so'm",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.redAccent),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data!.docs[index].data().title!.price ?? "",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                      ),
                                      const Text(
                                        " so'm dan",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  const Divider(thickness: 2),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0, vertical: 6.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "1 Taklif",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        Spacer(),
                                        InkWell(


                                            onTap: () {

                                              // snapshot.data?.docs[index].data().like == true ? snapshot.data?.docs[index].data().like = true : snapshot.data?.docs[index].data().like = false;
                                            }, child: snapshot.data?.docs[index].data().like != true  ? const Icon(Icons.favorite_border) : const Icon(Icons.favorite,color: Colors.red,) )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    // itemCount: snapshot.data?.length ?? 0,
                  ),
                );
              },

            ),
          ),
        ],
      ),
      floatingActionButton:   FloatingButtonActionCategoriya( collectionName: widget.kategoriya, showCard: true,),
    );
  }
}
