import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:yuksalish_1/pages/admin_pages/admin_panel_home.dart';
import 'package:yuksalish_1/pages/alerts/delete_alertdialog.dart';
import 'package:yuksalish_1/pages/katalog/product_pages/product_list_create_page.dart';

import '../../model/firebase_services/model_services.dart';
import '../../model/provider/model_pv.dart';

class CatalogList extends StatefulWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  State<CatalogList> createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  bool isLoadingPage = false;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainProvider>(context);
    final moviesRef = FirebaseFirestore.instance
        .collection('catalog')
        .withConverter<CategoryList>(
          fromFirestore: (snapshots, _) =>
              CategoryList.fromJson(snapshots.data()!),
          toFirestore: (productList, _) => productList.toJson(),
        );

    return StatefulBuilder(builder: (context, setState) {
      return StreamBuilder<QuerySnapshot<CategoryList>>(
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
                        child: SpinKitFadingFour(
                      color: Colors.indigo,
                    )),
                  ),
                ],
              );
            } else if (snapshot.requireData.docs.isEmpty) {
              Timer(const Duration(seconds: 3), () {
                setState(() {
                  viewModel.isLoadingKategoriyaFunction(true);
                });
              });
              return !viewModel.isLoadingKategoriya
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SpinKitFadingFour(
                            color: Colors.indigo,
                          )
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: Center(
                            child: Text(
                              "Ma'lumot hali qo'shilmagan!",
                              style: TextStyle(
                                  color: Colors.indigo.shade200,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    );
            } else {
              return Expanded(
                flex: 10,
                child: RefreshIndicator(
                  onRefresh: () async {},
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView.builder(
                        itemCount: snapshot.requireData.size,
                        itemBuilder: (BuildContext context, int index) {
                       final item = snapshot.data!.docs[index].data();
                          if (isLoadingPage) {
                            Center(
                              child: Text(
                                "Ma'lumot hali mavjudmas!",
                                style: TextStyle(
                                    color: Colors.indigo.shade200,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            );
                          }
                          return snapshot.data?.docs[index].data().image != ""
                              ? Dismissible(
                            direction: DismissDirection.endToStart,


                                  key: GlobalKey(debugLabel: item.title!.title),
                                  background: Container(
                                    color: Colors.green,
                                  ),
                                  secondaryBackground: Container(
                                    color: Colors.red,
                                  ),
                                  onDismissed: (value) {
                                   showDialog(context: context, builder: (BuildContext context)=> DeleteAlertDialog(category: item, collection: "catalog"));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.indigo.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    // height: 65,
                                    margin: const EdgeInsets.only(
                                        top: 5, bottom: 5, right: 12, left: 12),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Expanded(
                                            child: Text(
                                              snapshot.data!.docs[index]
                                                      .data()
                                                      .title!
                                                      .title ??
                                                  "",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          // const SizedBox(
                                          //   width: 12,
                                          // ),

                                          Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Colors.indigo
                                                    .withOpacity(0.2),
                                              ),
                                              margin: const EdgeInsets.all(8.0),
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
                                                placeholder: const AssetImage(
                                                  "assets/images/icons/picture_ic.png",
                                                ),
                                              )),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        if (kDebugMode) {
                                          print(index);
                                        }
                                        if (kDebugMode) {
                                          print(snapshot.data!.docs[index]
                                            .data()
                                            .title!.title
                                            );
                                        }
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        CreateProduct(
                                                          kategoriya: item
                                                                  .title!
                                                                  .title ??
                                                              "",
                                                        )));
                                      },
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
                ),
              );
            }
          });
    });
  }


}
