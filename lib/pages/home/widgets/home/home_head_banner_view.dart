import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:yuksalish_1/model/provider/model_pv.dart';

import '../../../../model/firebase_services/model_services.dart';

Widget homeBannerView(context) {
  final size = MediaQuery.of(context).size;

  final viewModel = Provider.of<MainProvider>(context);
  final moviesRef = FirebaseFirestore.instance
      .collection('catalog')
      .withConverter<CategoryList>(
        fromFirestore: (snapshots, _) =>
            CategoryList.fromJson(snapshots.data()!),
        toFirestore: (productList, _) => productList.toJson(),
      );

  return Container(
    height: size.height * 0.32,
    color: Colors.indigo.withOpacity(0.3),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<QuerySnapshot<CategoryList>>(
            stream: moviesRef.snapshots(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
              if (!snapshot.hasData) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.18,
                      margin: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Shimmer(
                            duration: const Duration(milliseconds: 800),
                            //Default value
                            interval: const Duration(milliseconds: 300),
                            //Default value: Duration(seconds: 0)
                            color: Colors.white,
                            //Default value
                            colorOpacity: 0.4,
                            //Default value
                            enabled: true,
                            //Default value
                            direction: const ShimmerDirection.fromLTRB(),
                            //Default Value
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.black12,
                              ),
                            )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          5,
                          (index) => ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Shimmer(
                              duration: const Duration(milliseconds: 800),
                              //Default value
                              interval: const Duration(milliseconds: 300),
                              //Default value: Duration(seconds: 0)
                              color: Colors.white,
                              //Default value
                              colorOpacity: 0.4,
                              //Default value
                              enabled: true,
                              //Default value
                              direction: const ShimmerDirection.fromLTRB(),
                              child: Indicator(
                                0 == index ? true : false,
                                false,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }
              return Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        height: size.height * 0.20,
                        onPageChanged: (index, reason) {
                          viewModel.isSelected(index);
                        },
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 3.0),
                    items: snapshot.data!.docs.map((document) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    NetworkImage(document.data().image ?? ""),
                              ),
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 5), // changes x,y position of shadow
                                ),
                              ],
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0,
                                                right: 12,
                                                bottom: 15),
                                            child: Text(
                                              document
                                                  .data()
                                                  .title!
                                                  .title
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, right: 12, bottom: 15),
                                        child: Text(
                                          document
                                              .data()
                                              .title!
                                              .price
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                            snapshot.data!.docChanges.length,
                            (index) => Indicator(
                                  viewModel.pageIndex == index ? true : false,
                                  true,
                                ))
                      ],
                    ),
                  ),
                ],
              );
            }),
        Center(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            height: 55,
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white70,
            ),
            child: Center(
              child: TextField(
                textInputAction: TextInputAction.search,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "Nimani izlayapsiz?...",
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.search_outlined,
                      color: Colors.grey[400],
                    )),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        )
      ],
    ),
  );
}

class Indicator extends StatelessWidget {
  final bool isActive;
  final bool isLoading;

  const Indicator(
    this.isActive,
    this.isLoading, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutQuad,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 22.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: isActive
            ? isLoading
                ? Colors.indigo
                : Colors.grey
            : isLoading
                ? Colors.white
                : Colors.grey,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
