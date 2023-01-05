import 'dart:ui';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuksalish_1/model/provider/model_pv.dart';


class KatalogAppBar extends StatefulWidget {
  const KatalogAppBar({Key? key}) : super(key: key);

  @override
  State<KatalogAppBar> createState() => _KatalogAppBarState();
}

class _KatalogAppBarState extends State<KatalogAppBar> {



  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final viewModel = Provider.of<MainProvider>(context);
    return ClipRect(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 10.0),
            child: Container(
              width: double.infinity,
              height: size.height * 0.2,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.elliptical(0, 0),
                    topLeft: Radius.elliptical(0, 0),
                  ),
                  color: Colors.indigo.withOpacity(0.3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Kategoriyalar",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 45,
                    margin: const EdgeInsets.only(
                        right: 10, left: 10, bottom: 10),
                    child: AnimSearchBar(
                      // rtl: true,
                      width: 400,
                      textController: viewModel.textController,
                      onSuffixTap: () {
                        setState(() {
                          viewModel.textController.clear();
                        });
                      },
                    ),
                  ),
                ],
              ),
            )));

  }
}
