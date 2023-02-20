import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

Widget taskListNotData(allList){
  return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection:
      !allList ? Axis.horizontal : Axis.vertical,
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 135,
          margin: const EdgeInsets.all(8),
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
        );
      });
}