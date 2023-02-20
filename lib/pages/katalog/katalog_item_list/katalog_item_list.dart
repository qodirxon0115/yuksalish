import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuksalish_1/model/firebase_services/model_services.dart';
import 'package:yuksalish_1/model/provider/model_pv.dart';

class KatalogItemList extends StatelessWidget {
  const KatalogItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String  title;
    String  image;
    // void _create() async {
    //   final FirebaseFirestore firestore = FirebaseFirestore.instance;
    //
    //   try {
    //     await firestore.collection("katalog").doc("${title.replaceAll(" ", "_")}_$image").set({
    //       "title" : title,
    //       "image" : image,
    //
    //     });
    //   }catch (e){
    //     print(e);
    //   }
    // }
    double _childAspectRatio = 0.61;
    final size = MediaQuery.of(context).size;
    final moviesRef = FirebaseFirestore.instance
        .collection('productList')
        .withConverter<CategoryList>(
          fromFirestore: (snapshots, _) =>
              CategoryList.fromJson(snapshots.data()!),
          toFirestore: (productList, _) => productList.toJson(),
        );
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo.withOpacity(0.3),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.08),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();

                },
                icon: Icon(Icons.arrow_back,color: Colors.indigo,),
              ),
            ],
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot<CategoryList>>(
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

          return GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: _childAspectRatio,
              mainAxisSpacing: 20,
              crossAxisSpacing: 15,
            ),
            itemCount: snapshot.requireData.size,
            padding: const EdgeInsets.only(bottom: 10, left: 20),
            itemBuilder: (context, index) {
              if ("telefon" == snapshot.data!.docs[index].data().category) {
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
                              snapshot.data!.docs[index].data().title!.title ?? "",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/image_1.png"),
                            ),
                            color: Color(0xffCFECEC),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffF0F8FF).withOpacity(0.9),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(
                                    0, 5), // changes x,y position of shadow
                              ),
                            ],
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
                                  snapshot.data!.docs[index].data().price ?? "",
                                  style: TextStyle(
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
                                  snapshot.data!.docs[index].data().price ?? "",
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
                                      onTap: () {},
                                      child: const Icon(Icons.favorite_border))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Text("");
            },
            // itemCount: snapshot.data?.length ?? 0,
          );
        },
      ),

    );
  }




}
