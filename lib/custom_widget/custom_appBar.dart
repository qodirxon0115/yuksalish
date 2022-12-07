


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuksalish_1/model/provider/model_pv.dart';
import 'package:yuksalish_1/model/ui_modal_sheet_list.dart';
import 'package:yuksalish_1/pages/sign/signin_page.dart';

import '../widgets/home/show_modal_sheet.dart';

class CustomScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;
  final List<Color>? colors;
  final double? height;
  final double? width;
  final double? topRight;
  final double? topLeft;
  final double? bottomLeft;
  final double? bottomRight;

  PersistentHeader({
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
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    List<Color> listColor = [
      Colors.transparent,
      Colors.transparent,
    ];
    return Container(
      width: width ?? double.infinity,
      height: height ?? 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.elliptical(topRight ?? 0, topRight ?? 0),
          topLeft: Radius.elliptical(topRight ?? 0, topRight ?? 0),
          // topLeft: Radius.circular(topLeft! ?? 0),
          // bottomLeft: Radius.circular(bottomLeft! ?? 0),
          // bottomRight: Radius.circular(bottomRight! ?? 0),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: colors ?? listColor,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          widget,
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => height ?? 80;

  @override
  double get minExtent => height ?? 80;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

Widget appBar(context,_key){
  final viewModel = Provider.of<MainProvider>(context);
  return SliverPersistentHeader(
    pinned: true,
    delegate: PersistentHeader(
      colors: [
        Colors.black12,
        Colors.black12,
      ],
      widget: Row(
        // Format this to meet your need
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              showModalSheetWidget(context,viewModel.listButton(SignIn(), context, "SignIn")  );
            },
            icon: Icon(Icons.menu),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              showModalSheetWidget(context,ModalSheetListAccount.UIWidgetList );
            },
            icon: Icon(Icons.person),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    ),
  );
}