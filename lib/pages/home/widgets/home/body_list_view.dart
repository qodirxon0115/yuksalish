import 'package:flutter/material.dart';
import 'package:yuksalish_1/pages/admin_pages/admin_panel_home.dart';
import 'package:yuksalish_1/pages/home/widgets/home/task_list.dart';


Widget bodyListView(context) {
  return Column(
    children: [
      SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Expanded(
              flex: 6,
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.red),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      " % Chegirmalar ",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  )),
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
                    onPressed: () {},
                    child: const Text(
                      " Muddatli to'lov ",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            const Spacer(),
          ],
        ),
      ),

      const SizedBox(
        height: 10,
      ),

      // Column(
      //   children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  " Kategoriyalar ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                TextButton(
                  onPressed: () {

                  },
                  child: const Text(
                    " Barchasini ko'rish ",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          tasksList(context),
          // Container(
          //   height: 200,
          //   color: Colors.grey,
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 20,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Container(
          //           height: 50,
          //           child: const Image(
          //             image: AssetImage("assets/images/image_1.png"),
          //           ),
          //         );
          //       }),
          // ),
          // Container(
          //   height: 200,
          //   color: Colors.grey,
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 20,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Container(
          //           height: 50,
          //           child: const Image(
          //             image: AssetImage("assets/images/image_1.png"),
          //           ),
          //         );
          //       }),
          // ),
          // Container(
          //   height: 200,
          //   color: Colors.grey,
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 20,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Container(
          //           height: 50,
          //           child: const Image(
          //             image: AssetImage("assets/images/image_1.png"),
          //           ),
          //         );
          //       }),
          // ),
        ],
      ),
    ],
  );
}

