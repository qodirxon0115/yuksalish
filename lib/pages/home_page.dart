import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:yuksalish_1/pages/katalog_page.dart';
import 'package:yuksalish_1/pages/savatcha_page.dart';
import 'package:yuksalish_1/pages/tulovlar_page.dart';
import 'package:yuksalish_1/widgets/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();

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

List<Widget> ListPage =  [

  //homePage
  homeWidget(scrollController),

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
    activeColor: Colors.black,
  ),
  BottomNavyBarItem(
      icon: const Icon(Icons.apps_outlined),
      title: const Text('Katalog'),
      activeColor: Colors.black
  ),
  BottomNavyBarItem(
      icon: const Icon(Icons.shopping_cart),
      title: const Text('Savatcha'),
      activeColor: Colors.black
  ),
  BottomNavyBarItem(
      icon: const Icon(Icons.monetization_on_outlined),
      title: const Text("To'lov"),
      activeColor: Colors.black
  ),
];
    return Scaffold(

      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,   // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
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
    );
  }
}
