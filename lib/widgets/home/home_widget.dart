import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuksalish_1/model/provider/model_pv.dart';
import 'package:yuksalish_1/widgets/home/home_head_banner_view.dart';

import '../../custom_widget/custom_appBar.dart';
import '../../model/ui_modal_sheet_list.dart';

Widget homeWidget(scrollController, widgetViewController, _key, context) {
  final height = MediaQuery.of(context).size.height * 0.8;
  return CustomScrollView(
    scrollBehavior: CustomScroll(),
    controller: scrollController,
    slivers: [
      appBar(context, _key),
      body(widgetViewController,context),
    ],
  );
}



Widget body(widgetViewController,context) {
  final viewModel = Provider.of<MainProvider>(context);

  return SliverList(
    delegate: SliverChildListDelegate([
      Container(
        child: Column(
          children: [
            //logo
            homeBannerView(context),

            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Expanded(
                    flex: 6,
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.red),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            " % Chegirmalar ",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 6,
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.green),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            " Muddatli to'lov ",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                  Spacer(),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // Column(
            //   children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          " Kategoriyalar ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            " Barchasini ko'rish ",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    color: Colors.grey,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 50,
                            child: const Image(
                              image: AssetImage("assets/images/image_1.png"),
                            ),
                          );
                        }),
                  ),
                  Container(
                    height: 200,
                    color: Colors.grey,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 50,
                            child: const Image(
                              image: AssetImage("assets/images/image_1.png"),
                            ),
                          );
                        }),
                  ),
                  Container(
                    height: 200,
                    color: Colors.grey,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 50,
                            child: const Image(
                              image: AssetImage("assets/images/image_1.png"),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            // ],
            // ),
          ],
        ),
      ),
    ]),
  );
}
