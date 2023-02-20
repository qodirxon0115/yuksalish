import 'dart:async';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:yuksalish_1/pages/home/widgets/home/home_widget.dart';
import 'package:yuksalish_1/pages/home/widgets/home/task_list_widget/product_list_firebase.dart';
import 'package:yuksalish_1/pages/savatcha/savatcha_page.dart';
import 'package:yuksalish_1/pages/tulovlar/tulovlar_page.dart';

import '../katalog/katalog_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ScrollController scrollController = ScrollController();
  final PageController widgetViewController = PageController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();


  int _selectedIndex = 0;


  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 2),(){
    //   setState((){
    //     bolean = true;
    //   });
    //
    // });
List<Widget> ListPage =  [

  //homePage
  homeWidget(scrollController,widgetViewController,_key,context),

  // Katalog
  const KatalogPage(),

  // savatcha
  const SavatchaPage(),

  // tolovlar
  const TulovlarPage(),
];

List<BottomNavyBarItem> NavigationBatItems =  [
  BottomNavyBarItem(
    icon: const Icon(Icons.home_outlined),
    title: const Text('Bosh sahifa'),
    activeColor: Colors.indigo.withOpacity(0.8),
  ),
  BottomNavyBarItem(
      icon: Image.asset("assets/images/icons/apps_ic.png",width: 28,height: 22,color: Colors.indigo,),
      title: const Text('Katalog'),
    activeColor: Colors.indigo.withOpacity(0.8),

  ),
  BottomNavyBarItem(
      icon: const Icon(Icons.shopping_cart),
      title: const Text('Savatcha'),
    activeColor: Colors.indigo.withOpacity(0.8),

  ),
  BottomNavyBarItem(
      icon: const Icon(Icons.monetization_on_outlined),
      title: const Text("To'lov"),
    activeColor: Colors.indigo.withOpacity(0.8),

  ),
];
    return Scaffold(

      key: _key,

      bottomNavigationBar: BottomNavyBar(

        selectedIndex: _selectedIndex,
        showElevation: true,   // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index,

              duration: const Duration(milliseconds: 300), curve: Curves.ease,);
        }),
        items: NavigationBatItems,
      ),

      body: PageView(
        controller: _pageController,
        onPageChanged: (int index){
          setState(() {
            _selectedIndex = index;
          });
        },
        children: ListPage,
      ),
      // drawer: Drawer(),
      // endDrawer: Container(),
    );
  }
}
