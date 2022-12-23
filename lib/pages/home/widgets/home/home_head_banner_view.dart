import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:yuksalish_1/model/provider/model_pv.dart';

import '../../../../model/data/database_helpaer.dart';
import '../../../../model/data/task.dart';

Widget homeBannerView(context) {
  final viewModel = Provider.of<MainProvider>(context);

  return Container(
    height: MediaQuery.of(context).size.height * 0.35,
    color: Colors.black12,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 8,
          child: Consumer<MainProvider>(builder: (context, data, child) {
            return StreamBuilder(
                stream: DatabaseHelper.intance.getTasks().asStream(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
                  return snapshot.data != null
                      ? Column(
                          children: [

                                 CarouselSlider(
                                    items: snapshot.data
                                        ?.map(
                                          (item) => Container(
                                            margin: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              image: const DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "assets/images/image_1.png"),
                                              ),
                                              color: Colors.indigo,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                  offset: Offset(0,
                                                      5), // changes x,y position of shadow
                                                ),
                                              ],
                                            ),
                                            child: Center(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            
                                                            children: [
                                                              Center(
                                                                child: Padding(
                                                                  padding: const EdgeInsets.only(left: 15.0,right: 12,bottom: 15),

                                                                  child: Text(
                                                                      item.title.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                                                ),
                                                              ),
                                                              Center(
                                                                child: Text(
                                                                      item.title.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                                                              ),
                                                            ],
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Center(
                                                            child: Padding(
                                                              padding: const EdgeInsets.only(left: 15.0,right: 12,bottom: 15),
                                                              child: Text(
                                                                  item.price.toString(),style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        )
                                        .toList(),
                                    options: CarouselOptions(
                                        onPageChanged: (index, reason) {
                                          viewModel.isSelected(index);
                                        },
                                        autoPlay: true,
                                        enlargeCenterPage: true,
                                        aspectRatio: 3.0),
                                  ),


                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ...List.generate(
                                      snapshot.data!.length,
                                      (index) => Indicator(
                                            viewModel.pageIndex == index
                                                ? true
                                                : false,
                                          ))
                                ],
                              ),
                            ),

                            //   Expanded(
                            //   child: CarouselSlider(
                            //
                            //           items: snapshot.data
                            //               ?.map((item) =>
                            //               Expanded(
                            //                   child:  Card(
                            //                 child: Container(
                            //                   width: 2000,
                            //             decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/images/image_1.png"))),
                            //                       child: Center(child: Text(item.title.toString())),
                            //                     ),
                            //               )))
                            //               .toList(),
                            //           options: CarouselOptions(
                            //
                            //             autoPlay: true,
                            //             enlargeCenterPage: true,
                            //             aspectRatio: 3.0
                            //           ),
                            //
                            //     ),
                            // ),
                          ],
                        )
                      :  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 135,
                    margin: const EdgeInsets.all(8),
                    child: Shimmer(
                        duration:
                        const Duration(milliseconds: 800),
                        //Default value
                        interval:
                        const Duration(milliseconds: 300),
                        //Default value: Duration(seconds: 0)
                        color: Colors.white,
                        //Default value
                        colorOpacity: 0.4,
                        //Default value
                        enabled: true,
                        //Default value
                        direction:
                        const ShimmerDirection.fromLTRB(),
                        //Default Value
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(25),
                            color: Colors.black12,
                          ),
                        )),
                  );

                  //   Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     const SizedBox(
                  //       height: 12,
                  //     ),
                  //     Expanded(
                  //       child: Container(
                  //
                  //         decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             borderRadius: BorderRadius.circular(18)),
                  //         child: Image.asset(
                  //           "assets/images/image_1.png",
                  //         ),
                  //       ),
                  //     ),
                  //     Row(
                  //       children: [
                  //         Column(
                  //           children: [
                  //             Container(
                  //                 child: Text(
                  //                     snapshot.data![index].title ?? "")),
                  //             Container(
                  //                 child: Text(
                  //                     snapshot.data![index].description ?? "")),
                  //           ],
                  //         ),
                  //         const Spacer(),
                  //         Column(
                  //           children: [
                  //             Container(
                  //                 child: Text(
                  //                     snapshot.data![index].category ?? "")),
                  //             Container(
                  //                 child: Text(
                  //                     snapshot.data![index].characteristic ?? "")),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // )
                }
                // itemCount: snapshot.data?.length ?? 0,
                );
            //     : Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: const [
            //     CircularProgressIndicator(),
            //   ],
            // );
          }),

          // PageView.builder(
          //     controller: PageController(viewportFraction: 0.7),
          //     physics: const BouncingScrollPhysics(),
          //     onPageChanged: (index) {
          //       viewModel.isSelected(index);
          //     },
          //     scrollDirection: Axis.horizontal,
          //     itemCount: itemLength,
          //     itemBuilder: (BuildContext context, index) {
          //       // index != null ? viewModel.pageIndex : index = viewModel.pageIndex;
          //       return
          //
          //       //   Column(
          //       //   crossAxisAlignment: CrossAxisAlignment.start,
          //       //   mainAxisAlignment: MainAxisAlignment.start,
          //       //   children: [
          //       //     Expanded(
          //       //       child: Container(
          //       //         height: 170,
          //       //         width: MediaQuery.of(context).size.width * 0.62,
          //       //         margin: const EdgeInsets.only(
          //       //           right: 5,
          //       //         ),
          //       //         child: const Card(
          //       //           child: Image(
          //       //             image: AssetImage("assets/images/image_1.png"),
          //       //           ),
          //       //         ),
          //       //       ),
          //       //     ),
          //       //   ],
          //       // );
          //     }),
        ),
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
        const SizedBox(
          height: 8,
        )
      ],
    ),
  );
}

class Indicator extends StatelessWidget {
  final bool isActive;

  const Indicator(
    this.isActive, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 22.0 : 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
