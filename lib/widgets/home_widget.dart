import 'package:flutter/material.dart';

Widget homeWidget(scrollController){
  return CustomScrollView(
    scrollBehavior: CustomScroll(),
    controller: scrollController,
    slivers: [

      SliverList(
        delegate: SliverChildListDelegate([
          Container(
            child: Column(
              children: [

                //logo
                Container(
                  height: 270,
                  color: Colors.black12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        height: 170,
                        width: 250,
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: const Image(
                          image: AssetImage("assets/images/"),
                        ),
                      ),

                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          height: 55,
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white70,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Nimani izlayapsiz?...", hintStyle: TextStyle(color: Colors.grey[400]),
                                border: InputBorder.none,
                                icon: Icon(Icons.search_outlined, color: Colors.grey[400],)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [

                      Container(
                          height: 30,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.red),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextButton(
                            onPressed: (){},
                            child: const Text(" % Chegirmalar ",
                              style: TextStyle(color: Colors.red,
                                  fontWeight: FontWeight.bold),),
                          )
                      ),

                      const SizedBox(width: 25,),

                      Container(
                          height: 30,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.green),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextButton(
                            onPressed: (){},
                            child: const Text(" Muddatli to'lov ",
                              style: TextStyle(color: Colors.green,
                                  fontWeight: FontWeight.bold),),
                          )
                      ),

                    ],
                  ),
                ),

                const SizedBox(height: 25,),

                // Column(
                //   children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(" Kategoriyalar ",
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold, fontSize: 20),),

                          TextButton(
                            onPressed: (){},
                            child: const Text(" Barchasini ko'rish ",
                              style: TextStyle(color: Colors.blue,
                                  fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),

                      const SizedBox(height: 20,),


                      Container(
                        height: 200,
                        color: Colors.grey,
                        child:  ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget> [

                            Container(
                              height: 50,
                              child: const Image(
                                image: AssetImage("assets/images/image_1.png"),
                              ),
                            ),
                            const SizedBox(width: 10,),

                            Container(
                              height: 50,
                              child: const Image(
                                image: AssetImage("assets/images/image_1.png"),
                              ),
                            ),
                            const SizedBox(width: 10,),

                            Container(
                              height: 50,
                              child: const Image(
                                image: AssetImage("assets/images/image_1.png"),
                              ),
                            ),
                            const SizedBox(width: 10,),

                            Container(
                              height: 50,
                              child: const Image(
                                image: AssetImage("assets/images/image_1.png"),
                              ),
                            ),
                            const SizedBox(width: 10,),

                            Container(
                              height: 50,
                              child: const Image(
                                image: AssetImage("assets/images/image_1.png"),
                              ),
                            ),
                            const SizedBox(width: 10,),

                            Container(
                              height: 50,
                              child: const Image(
                                image: AssetImage("assets/images/image_1.png"),
                              ),
                            ),
                            const SizedBox(width: 10,),

                            Container(
                              height: 50,
                              child: const Image(
                                image: AssetImage("assets/images/image_1.png"),
                              ),
                            ),
                            const SizedBox(width: 10,),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
                // ],
                // ),

              ],
            ),
          ),
        ]),
      ),



    ],
  );
}

class CustomScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}