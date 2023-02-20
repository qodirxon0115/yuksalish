import 'package:flutter/material.dart';
import 'package:yuksalish_1/pages/katalog/catalog_list.dart';
import 'package:yuksalish_1/pages/katalog/katalog_appBar/katalog_appbar.dart';
import 'package:yuksalish_1/pages/katalog/katalog_item_list/create_catalog.dart';

class KatalogPage extends StatefulWidget {
  const KatalogPage({Key? key}) : super(key: key);

  @override
  State<KatalogPage> createState() => _KatalogPageState();
}

class _KatalogPageState extends State<KatalogPage> {
  Widget widget1 = const Center(
    child: Text("Ma'lumot hali qo'shilmagan"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children:  [
          // const SizedBox(
          //   height: 35,
          // ),
          KatalogAppBar(title: '', isActiveBack: false,),
          const CatalogList(),
        ],
      ),
      floatingActionButton:  const FloatingButtonActionCategoriya(showCard: false, collectionName: '',),
    );
  }
}
