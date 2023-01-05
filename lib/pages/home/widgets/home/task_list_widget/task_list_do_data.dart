import 'package:flutter/material.dart';

Widget taskListDoDataItem(allList, snapshot) {
  double _childAspectRatio;
  _childAspectRatio = 0.61;
  return GridView.builder(
    scrollDirection: Axis.vertical,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: _childAspectRatio,
      mainAxisSpacing: 20,
      crossAxisSpacing: 15,
    ),
    itemCount: snapshot.data?.length,
    padding: const EdgeInsets.only(bottom: 10, left: 20),
    itemBuilder: (context, index) {
      return Card(
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: Colors.white,
        shadowColor: Colors.grey.shade50,
        elevation: 12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    snapshot.data?[index].title ?? "",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  // image: const DecorationImage(
                  //   fit: BoxFit.cover,
                  //   // image: AssetImage("assets/images/image_1.png"),
                  // ),
                  // color: Color(0xffCFECEC),
                  color: Color(0xffCFECEC),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffF0F8FF).withOpacity(0.9),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 5), // changes x,y position of shadow
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        snapshot.data?[index].price ?? "",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.redAccent),
                      ),
                      const Text(
                        " so'm",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.redAccent),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        snapshot.data?[index].price ?? "",
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                      const Text(
                        " so'm dan",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  const Divider(thickness: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 2.0, vertical: 6.0),
                    child: Row(
                      children: [
                        const Text(
                          "1 Taklif",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Spacer(),
                        InkWell(
                          
                          
                            onTap: () {}, child: const Icon(Icons.favorite_border))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
    // itemCount: snapshot.data?.length ?? 0,
  );
}
