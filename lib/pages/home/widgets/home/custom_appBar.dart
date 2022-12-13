import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuksalish_1/model/provider/model_pv.dart';
import 'package:yuksalish_1/model/ui_modal_sheet_list.dart';
import 'package:yuksalish_1/pages/home/home_page.dart';
import 'package:yuksalish_1/pages/sign/signin_page.dart';

import '../../../admin_pages/admin_panel_home.dart';
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
          const SizedBox(
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

Widget appBar(context, key,seeAll) {
  final viewModel = Provider.of<MainProvider>(context);
  return SliverPersistentHeader(
    pinned: true,
    delegate: PersistentHeader(
      colors: [
        Colors.black12,
        Colors.black12,
      ],
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              seeAll ?
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> HomePage())):
              // Drawer
              showModalSheetWidget(
                  context, viewModel.listButton(const SignIn(), context, "SignIn"));
            },
            icon: seeAll ?  const Icon(Icons.arrow_back) : const Icon(Icons.menu),
          ),
          const Spacer(),
          GestureDetector(
            onLongPress: () {
              viewModel.longPressed();
            },
            child: !seeAll ? IconButton(
              onPressed: () {
                viewModel.isLongPressed != true
                    ? showModalSheetWidget(
                        context, ModalSheetListAccount.uiWidgetList)
                    : Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AdminPanelCreateTask()));
                viewModel.isLongPressed = false;
              },
              icon: const Icon(Icons.person),
            ) : Container(),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    ),
  );
}
