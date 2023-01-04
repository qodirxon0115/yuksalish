import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuksalish_1/model/provider/model_pv.dart';
import 'package:yuksalish_1/pages/home/home_page.dart';

import '../../../../admin_pages/admin_panel_home.dart';
import 'show_modal_sheet.dart';

class CustomScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;
  final BuildContext context;
  final List<Color>? colors;
  final double? height;
  final double? width;
  final double? topRight;
  final double? topLeft;
  final double? bottomLeft;
  final double? bottomRight;

  PersistentHeader({
    required this.context,
    required this.widget,
    this.colors,
    this.height,
    this.width,
    this.bottomRight,
    this.topRight,
    this.topLeft,
    this.bottomLeft,
  });

  @override
  double get maxExtent => height ?? MediaQuery.of(context).size.height * 0.2;

  @override
  double get minExtent => height ?? MediaQuery.of(context).size.height * 0.2;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = MediaQuery.of(context).size;
    return ClipRect(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 10.0),
            child: Container(
              width: width ?? double.infinity,
              height: height ?? size.height * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(topRight ?? 0, topRight ?? 0),
                    topLeft: Radius.elliptical(topRight ?? 0, topRight ?? 0),
                  ),
                  color: Colors.indigo.withOpacity(0.3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget,
                ],
              ),
            )));
  }
}

Widget appBar(context, key, seeAll, showIcon) {
  final size = MediaQuery.of(context).size;
  final viewModel = Provider.of<MainProvider>(context);
  List<String> listTitle = [
    "Ism Familya:",
    "Telefon raqam:",
    "Viloyat:",
    "Tuman:",
    "Manzil:",
  ];
  List<String> listItem = [
    "Falonchiyev Pistonchi",
    "+998 12 345 67 89",
    "Toshkent",
    "Tuman",
    "Manzil",
  ];
  return SliverPersistentHeader(
floating: true,
    pinned: true,
    delegate: PersistentHeader(

      widget:
      SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Container(
          child: !seeAll
              ? showIcon
                  ? Row(
                      children: <Widget>[
                        Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/logo_ic_home.png",
                                  // height: 50,
                                  width: 110,
                                  color: Colors.indigo,
                                ),
                                const SizedBox(
                                  height: 8,
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              "Yuksalish",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            )
                          ],
                        ),
                        const Spacer(),
                        showIcon
                            ? GestureDetector(
                                onLongPress: () {
                                  viewModel.longPressed();
                                },
                                child: !seeAll
                                    ? IconButton(
                                        onPressed: () {
                                          viewModel.isLongPressed != true
                                              ? showModalSheetWidget(
                                                  context,
                                                  ListView.builder(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount: listTitle.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                                int index) =>
                                                            Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.indigo
                                                            .withOpacity(0.1),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                15),
                                                      ),
                                                      // height: 65,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 5,
                                                              bottom: 5,
                                                              right: 12,
                                                              left: 12),
                                                      child: InkWell(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                15),
                                                        onTap: () {},
                                                        child: Row(
                                                          children: [
                                                            const SizedBox(
                                                              width: 12,
                                                            ),
                                                            Text(
                                                              "${listTitle[index]}",
                                                              style: const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            const Spacer(),
                                                            Text(
                                                              "${listItem[index]}",
                                                              style: const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            Container(
                                                              height:
                                                                  size.height *
                                                                      0.08,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                                color: Colors
                                                                    .indigo
                                                                    .withOpacity(
                                                                        0.2),
                                                              ),
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                            ),
                                                            const SizedBox(
                                                              width: 12,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          AdminPanelCreateTask()));
                                          viewModel.isLongPressed = false;
                                        },
                                        icon: const Icon(
                                          Icons.person,
                                          color: Colors.indigo,
                                        ),
                                      )
                                    : Container(
                                        color: Colors.transparent,
                                      ),
                              )
                            : Container(),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  : const Center(
                      child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Savatcha",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ))
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => HomePage()));
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    Spacer(
                      flex: 4,
                    ),
                    Center(
                        child: Text(
                      "Barchasini ko'rish",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                    Spacer(
                      flex: 5,
                    ),
                  ],
                ),
        ),
      ),
      context: context,
    ),
  );
}
