import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../../model/data/database_helpaer.dart';
import '../../../../model/data/task.dart';
import '../../../../model/provider/model_pv.dart';

Widget tasksList(context, bool allList) {
  final viewModel = Provider.of<MainProvider>(context);
  Timer(Duration(seconds: 2), () {
    viewModel.isLoading = false;
  });
  return SizedBox(
      height: !allList
          ? MediaQuery.of(context).size.height * 0.8
          : MediaQuery.of(context).size.height,
      child: Consumer<MainProvider>(builder: (context, data, child) {
        return FutureBuilder(
            future: DatabaseHelper.intance.getTasks(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
              return
                    viewModel.isLoading != true ?
                  GridView.builder(
                    scrollDirection: !allList ? Axis.horizontal : Axis.vertical ,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: snapshot.data?.length,
                    padding: const EdgeInsets.only(bottom: 10),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Expanded(
                            child: Container(

                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18)),
                              child: Image.asset(
                                "assets/images/image_1.png",
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      child: Text(
                                          snapshot.data![index].title ?? "")),
                                  Container(
                                      child: Text(
                                          snapshot.data![index].description ?? "")),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Container(
                                      child: Text(
                                          snapshot.data![index].category ?? "")),
                                  Container(
                                      child: Text(
                                          snapshot.data![index].characteristic ?? "")),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    // itemCount: snapshot.data?.length ?? 0,
                  )
                  :
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      scrollDirection:
                          !allList ? Axis.horizontal : Axis.vertical,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemBuilder: (context, index) {return  Container(

                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        height: 135,
                        margin: const EdgeInsets.all(8),

                        child: Shimmer(
                            duration: const Duration(milliseconds: 800), //Default value
                            interval: const Duration(milliseconds: 300),
                            //Default value: Duration(seconds: 0)
                            color: Colors.white, //Default value
                            colorOpacity: 0.4, //Default value
                            enabled: true, //Default value
                            direction: const ShimmerDirection.fromLTRB(),  //Default Value
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.black12,

                              ),
                            )),
                      );});
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircularProgressIndicator(),
                ],
              );
            });
      }));
}
