import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class KatalogPage extends StatefulWidget {
  const KatalogPage({Key? key}) : super(key: key);

  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // const SizedBox(
          //   height: 35,
          // ),
          ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 10.0),
                  child: Container(
                    width: double.infinity,
                    height: 110,
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
                        Container(
                          color: Colors.transparent,
                          height: 45,
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 10),
                          child: AnimSearchBar(
                            // rtl: true,
                            width: 400,
                            textController: textController,
                            onSuffixTap: () {
                              setState(() {
                                textController.clear();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ))),
          Expanded(
            flex: 10,
            child: ListView.builder(
                itemCount: listTitle.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    // height: 65,
                    margin: const EdgeInsets.only(
                        top: 5, bottom: 5, right: 12, left: 12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {},
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            listTitle[index],
                            style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.indigo.withOpacity(0.2),
                            ),
                            margin: const EdgeInsets.all(8.0),
                            child: Image.asset(listImage[index],
                                height: 88, width: 88),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  List<String> listTitle = [
    "Telefon va Gadjetlar",
    "Televizor/Video/Audio",
    "Maishiy Tehnika",
    "Kompyuter va orgtexnika",
    "Oshxona tehnikasi",
    "Uy va ishxona jihozlari",
  ];
  List<String> listImage = [
    "assets/images/iphone_14.png",
    "assets/images/tv_ic.png",
    "assets/images/gas_plita.png",
    "assets/images/pc_ic.png",
    "assets/images/oshxona_ic.png",
    "assets/images/uy_ishxona_ic.png",
  ];
}
