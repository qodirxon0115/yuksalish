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
    return Column(
      children: [
        const SizedBox(
          height: 35,
        ),
        Container(
          height: 45,
          margin: const EdgeInsets.only(right: 10, left: 10),
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
        Expanded(
          flex: 10,
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    "Tovarlar $index",
                    style: const TextStyle(fontSize: 18),
                  ),
                  trailing: Image.asset("assets/images/image_1.png"),
                );
              }),
        ),
      ],
    );
  }
}
