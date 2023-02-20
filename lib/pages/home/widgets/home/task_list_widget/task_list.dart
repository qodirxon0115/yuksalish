
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yuksalish_1/pages/alerts/delete_alertdialog.dart';
import 'package:yuksalish_1/pages/home/home_page.dart';

import '../../../../../model/firebase_services/model_services.dart';
import '../../../../admin_pages/admin_panel_home.dart';
class HomeListProduct extends StatefulWidget {
  const HomeListProduct({Key? key}) : super(key: key);

  @override
  State<HomeListProduct> createState() => _HomeListProductState();
}

class _HomeListProductState extends State<HomeListProduct> {
  @override
  Widget build(BuildContext context) {
    String collection = "Popular list";
    final moviesRef = FirebaseFirestore.instance
        .collection(collection)
        .withConverter<CategoryList>(
      fromFirestore: (snapshots, _) =>
          CategoryList.fromJson(snapshots.data()!),
      toFirestore: (productList, _) => productList.toJson(),
    );

    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.586,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: StreamBuilder<QuerySnapshot<CategoryList>>(

        stream: moviesRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: GridView.builder(

              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.61,
                mainAxisSpacing: 20,
                crossAxisSpacing: 15,
              ),
              itemCount: snapshot.requireData.size,
              padding: const EdgeInsets.only(
                  bottom: 10, left: 10, top: 15, right: 10),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child:  Card(
                      borderOnForeground: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      color: Colors.white,
                      shadowColor: Colors.grey.shade50,
                      elevation: 12,
                      child: InkWell(
                        onLongPress: () {
                          showDialog(context: context, builder: (BuildContext context)=> DeleteAlertDialog(category: snapshot.data!.docs[index].data(), collection: collection,));

                        },
                        child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(

                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 8),
                            decoration: BoxDecoration(

                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black54.withOpacity(0.15),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(
                                      0, 1), // changes x,y position of shadow
                                ),
                              ],
                            ),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: FadeInImage(
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

                          Container(
                            height: MediaQuery.of(context).size.height * 0.046,
                            margin: const EdgeInsets.only(top: 8.0,left: 8,right: 8),
                            child:
                                 Expanded(
                                   child: Text(
                                        "${snapshot.data!.docs[index]
                                            .data()
                                            .title!
                                            .title}",        softWrap: false,
                                     maxLines: 2,
                                     overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                 ),
                          ),

                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 8.0),
                             child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data!.docs[index]
                                            .data()
                                            .title!
                                            .price ?? "",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.redAccent),
                                      ),
                                      const Text(
                                        " so'm",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.redAccent),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data!.docs[index]
                                            .data()
                                            .title!
                                            .creditePrice ?? "",
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
                                        horizontal: 4.0, ),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "1 Taklif",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        const Spacer(),
                                        InkWell(


                                            onTap: () {
                                              // snapshot.data?.docs[index].data().like == true ? snapshot.data?.docs[index].data().like = true : snapshot.data?.docs[index].data().like = false;
                                            }, child: snapshot.data?.docs[index]
                                            .data()
                                            .like != true ? const Icon(
                                            Icons.favorite_border) : const Icon(
                                          Icons.favorite, color: Colors.red,))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                           ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              // itemCount: snapshot.data?.length ?? 0,
            ),
          );
        },

      ),
    );
  }

}