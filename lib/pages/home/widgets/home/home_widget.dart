import 'package:flutter/material.dart';

import 'custom_appBar.dart';
import 'body_list_view.dart';
import 'home_head_banner_view.dart';

Widget homeWidget(scrollController, widgetViewController, key, context) {
  bool seeAll = false;
  return CustomScrollView(
    scrollBehavior: CustomScroll(),
    controller: scrollController,
    slivers: [
      appBar(context, key,seeAll),
      body(widgetViewController,context),
    ],
  );
}



Widget body(widgetViewController,context) {

  return SliverList(
    delegate: SliverChildListDelegate([
      Column(
        children: [
          //logo
          homeBannerView(context),

          const SizedBox(
            height: 20,
          ),
          bodyListView(context),
        ],
      ),
    ]),
  );
}
