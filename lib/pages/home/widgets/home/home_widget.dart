import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuksalish_1/model/provider/model_pv.dart';

import '../../../../custom_widget/custom_appBar.dart';
import 'body_list_view.dart';
import 'home_head_banner_view.dart';

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
            bodyListView(context),
          ],
        ),
      ),
    ]),
  );
}
