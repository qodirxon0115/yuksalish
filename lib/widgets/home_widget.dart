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
                          image: AssetImage("assets/images/logo_ic.png"),
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

                const SizedBox(height: 20,),
                Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Spacer(),

                      Expanded(
                        flex: 6,

                        child: Container(
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
                      ),

                      const Spacer(),

                      Expanded(
                        flex: 6,
                        child: Container(
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
                      ),
                      const Spacer(),
                    ],
                  ),
                ),

                const SizedBox(height: 10,),

                Container(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
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

                      const SizedBox(height: 20,),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(" Eng qiziqarlilari ",
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
                      ),

                      Container(
                        padding: const EdgeInsets.only(top: 25, bottom: 25),
                        height: 400,
                        color: Colors.grey,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [

                            Container(
                              margin: const EdgeInsets.only(left: 25),
                              height: 300,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [

                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    height: 100,
                                    width: 110,
                                    child: const Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/images/redmi_1.jpg"),
                                    ),
                                  ),

                                  const SizedBox(height: 30,),
                                  const Center(
                                    child: Text("Redmi Note 11 Pro Plus 6/128 GB",
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold, fontSize: 18),),
                                  ),

                                  const SizedBox(height: 95,),
                                  const Center(
                                    child: Text(" 548 000 so'mdan  /  12 oyga",
                                      style: TextStyle(color: Colors.grey,
                                           fontSize: 15),
                                    ),
                                  ),

                                  const SizedBox(height: 10,),
                                  const Center(
                                    child: Text(" 4 710 000 so'm",
                                      style: TextStyle(color: Colors.black,
                                          fontSize: 20, fontWeight: FontWeight.bold,),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 15,),
                            Container(
                              height: 300,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [

                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    height: 100,
                                    width: 110,
                                    child: const Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/images/holod_1.png"),
                                    ),
                                  ),

                                  const SizedBox(height: 30,),
                                  const Center(
                                    child: Text("Samsung RB29FERNDWW (oq)",
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                  ),

                                  const SizedBox(height: 95,),
                                  const Center(
                                    child: Text(" 976 000 so'mdan  /  12 oyga",
                                      style: TextStyle(color: Colors.grey,
                                          fontSize: 15),),
                                  ),

                                  const SizedBox(height: 10,),
                                  const Center(
                                    child: Text(" 8 390 000",
                                      style: TextStyle(color: Colors.black,
                                        fontSize: 20, fontWeight: FontWeight.bold,),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 15,),
                            Container(
                              height: 300,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [

                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    height: 100,
                                    width: 110,
                                    child: const Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/images/holod_3.png"),
                                    ),
                                  ),

                                  const SizedBox(height: 30,),
                                  const Center(
                                    child: Text("Artel ART HD 345 (oq)",
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                  ),

                                  const SizedBox(height: 95,),
                                  const Center(
                                    child: Text(" 547 000 so'mdan  /  12 oyga",
                                      style: TextStyle(color: Colors.grey,
                                          fontSize: 15),
                                    ),
                                  ),

                                  const SizedBox(height: 10,),
                                  const Center(
                                    child: Text(" 4 700 000 so'm",
                                      style: TextStyle(color: Colors.black,
                                        fontSize: 20, fontWeight: FontWeight.bold,),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 15,),
                            Container(
                              height: 300,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [

                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    height: 100,
                                    width: 110,
                                    child: const Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/images/vivo_23.webp"),
                                    ),
                                  ),

                                  const SizedBox(height: 30,),
                                  const Center(
                                    child: Text("VIVO V23 5G 6/128GB",
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                  ),

                                  const SizedBox(height: 95,),
                                  const Center(
                                    child: Text(" 588 000 so'mdan  /  12 oyga",
                                      style: TextStyle(color: Colors.grey,
                                          fontSize: 15),
                                    ),
                                  ),

                                  const SizedBox(height: 10,),
                                  const Center(
                                    child: Text(" 4 692 000 so'm",
                                      style: TextStyle(color: Colors.black,
                                        fontSize: 20, fontWeight: FontWeight.bold,),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 15,),
                            Container(
                              height: 300,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [

                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    // height: 100,
                                    // width: 110,
                                    child: const Image(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/images/vivo_25e.webp"),
                                    ),
                                  ),

                                  const SizedBox(height: 30,),
                                  const Center(
                                    child: Text("VIVO V25e 6/128GB",
                                      style: TextStyle(color: Colors.black,
                                          fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                  ),

                                  const SizedBox(height: 95,),
                                  const Center(
                                    child: Text(" 603 000 so'mdan  /  12 oyga",
                                      style: TextStyle(color: Colors.grey,
                                          fontSize: 15),
                                    ),
                                  ),

                                  const SizedBox(height: 10,),
                                  const Center(
                                    child: Text(" 4 807 000 so'm",
                                      style: TextStyle(color: Colors.black,
                                        fontSize: 20, fontWeight: FontWeight.bold,),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 15,),
                            Container(
                              margin: const EdgeInsets.only(right: 25),
                              height: 300,
                              width: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 50,),
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 200,
                        child: Column(
                          children: const [

                            Center(
                              child: Text("Savollaringiz bormi?",
                                style: TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,
                                ),
                              ),
                            ),

                            SizedBox(height: 8,),
                            Center(
                              child: Text(" Qo'ng'iroq qiling! ",
                                style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,
                                ),
                              ),
                            ),

                            SizedBox(height: 8,),
                            Center(
                              child: Text(" +998(55) 801 8888",
                                style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
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