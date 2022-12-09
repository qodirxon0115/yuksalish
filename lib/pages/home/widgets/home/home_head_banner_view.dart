import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuksalish_1/model/provider/model_pv.dart';

Widget homeBannerView(context){
  final viewModel = Provider.of<MainProvider>(context);
  return Container(
    height: MediaQuery.of(context).size.height * 0.35,
    color: Colors.black12,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 8,
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
              onPageChanged: (index){
                viewModel.counter(index);
              },
              scrollDirection: Axis.horizontal,

              itemCount: 10,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin:
                        const EdgeInsets.only(left: 20, right: 20),
                        height: 170,
                        width: 250,
                        padding:
                        const EdgeInsets.only(left: 15, right: 15),
                        child: const Image(
                          image:
                          AssetImage("assets/images/image_1.png"),
                        ),
                      ),
                    ),



                  ],
                );
              }),
        ),
        Expanded(
          child: CarouselIndicator(
            activeColor: Colors.red,
            count: 10,
            index: viewModel.pageIndex,
          ),
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
        SizedBox(height: 8,)
      ],
    ),
  );
}