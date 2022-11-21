import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
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

    // List<Widget> containerColors = [
    //   Column(
    //     children: [
    //
    //       //logo
    //       Container(
    //         height: 270,
    //         color: Colors.black12,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Container(
    //               margin: const EdgeInsets.only(left: 20, right: 20),
    //               height: 170,
    //               width: 250,
    //               padding: const EdgeInsets.only(left: 15, right: 15),
    //               child: const Image(
    //                 image: AssetImage("assets/images/logo_ic.png"),
    //               ),
    //             ),
    //
    //             Center(
    //               child: Container(
    //                 margin: const EdgeInsets.only(left: 20, right: 20),
    //                 height: 55,
    //                 padding: const EdgeInsets.only(left: 15, right: 15),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(25),
    //                   color: Colors.white70,
    //                 ),
    //                 child: TextField(
    //                   decoration: InputDecoration(
    //                       hintText: "Nimani izlayapsiz?...", hintStyle: TextStyle(color: Colors.grey[400]),
    //                       border: InputBorder.none,
    //                       icon: Icon(Icons.search_outlined, color: Colors.grey[400],)
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //
    //       const SizedBox(height: 10,),
    //
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children:  [
    //
    //           Container(
    //               height: 30,
    //               width: 200,
    //               decoration: BoxDecoration(
    //                 border: Border.all(width: 3, color: Colors.red),
    //                 borderRadius: BorderRadius.circular(8),
    //               ),
    //               child: TextButton(
    //                 onPressed: (){},
    //                 child: const Text(" % Chegirmalar ",
    //                   style: TextStyle(color: Colors.red,
    //                       fontWeight: FontWeight.bold),),
    //               )
    //           ),
    //
    //           const SizedBox(width: 25,),
    //
    //           Container(
    //               height: 30,
    //               width: 200,
    //               decoration: BoxDecoration(
    //                 border: Border.all(width: 3, color: Colors.green),
    //                 borderRadius: BorderRadius.circular(8),
    //               ),
    //               child: TextButton(
    //                 onPressed: (){},
    //                 child: const Text(" Muddatli to'lov ",
    //                   style: TextStyle(color: Colors.green,
    //                       fontWeight: FontWeight.bold),),
    //               )
    //           ),
    //
    //         ],
    //       ),
    //
    //       const SizedBox(height: 25,),
    //
    //       // Column(
    //       //   children: [
    //       Container(
    //         padding: const EdgeInsets.all(20),
    //         child: Column(
    //           children: [
    //
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 const Text(" Kategoriyalar ",
    //                   style: TextStyle(color: Colors.black,
    //                       fontWeight: FontWeight.bold, fontSize: 20),),
    //
    //                 TextButton(
    //                   onPressed: (){},
    //                   child: const Text(" Barchasini ko'rish ",
    //                     style: TextStyle(color: Colors.blue,
    //                         fontWeight: FontWeight.bold),),
    //                 )
    //               ],
    //             ),
    //
    //             const SizedBox(height: 20,),
    //
    //             Container(
    //               height: 30,
    //               width: 200,
    //               color: Colors.black,
    //             ),
    //             const SizedBox(height: 20,),
    //             Container(
    //               height: 30,
    //               width: 200,
    //               color: Colors.black,
    //             ),
    //             const SizedBox(height: 20,),
    //             Container(
    //               height: 30,
    //               width: 200,
    //               color: Colors.black,
    //             ),
    //             const SizedBox(height: 20,),
    //             Container(
    //               height: 30,
    //               width: 200,
    //               color: Colors.black,
    //             ),
    //             const SizedBox(height: 20,),
    //             Container(
    //               height: 30,
    //               width: 200,
    //               color: Colors.black,
    //             ),
    //             const SizedBox(height: 20,),
    //             Container(
    //               height: 30,
    //               width: 200,
    //               color: Colors.black,
    //             ),
    //             const SizedBox(height: 20,),
    //             Container(
    //               height: 30,
    //               width: 200,
    //               color: Colors.black,
    //             ),
    //             const SizedBox(height: 20,),
    //             Container(
    //               height: 30,
    //               width: 200,
    //               color: Colors.black,
    //             ),
    //             const SizedBox(height: 20,),
    //             Container(
    //               height: 30,
    //               width: 200,
    //               color: Colors.black,
    //             ),
    //
    //           ],
    //         ),
    //       ),
    //       // ],
    //       // ),
    //
    //     ],
    //   ),
    //
    //   Container(
    //     color: Colors.blue,
    //     child: const Center(
    //       child: Text("Home", style: TextStyle(color: Colors.white),),
    //     ),
    //   ),
    //
    //   // savatcha
    //   Container(
    //     color: Colors.green,
    //     child: const Center(
    //       child: Text("Home", style: TextStyle(color: Colors.white),),
    //     ),
    //   ),
    //
    //   // tolovlar
    //   Container(
    //     color: Colors.redAccent,
    //
    //     child: const Center(
    //       child: Text("Home", style: TextStyle(color: Colors.white),),
    //     ),
    //   ),
    // ];

    return Scaffold(

      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,   // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
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
        ],
      ),

      body: PageView(
        controller: _pageController,
        onPageChanged: (int index){
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget> [

          //homePage
          homeWidget(scrollController),

          // Katalog
          Container(
            color: Colors.black,
            child: const Center(
              child: Text("Home", style: TextStyle(color: Colors.white),),
            ),
          ),

          // savatcha
          Container(
            color: Colors.black,
            child: const Center(
              child: Text("Home", style: TextStyle(color: Colors.white),),
            ),
          ),

          // tolovlar
          Container(
            color: Colors.black,

            child: const Center(
              child: Text("Home", style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
