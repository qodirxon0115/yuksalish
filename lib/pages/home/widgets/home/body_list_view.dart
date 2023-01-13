import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:yuksalish_1/pages/home/widgets/home/task_list_widget/product_list_firebase.dart';
import 'package:yuksalish_1/pages/home/widgets/home/task_list_widget/task_list.dart';
import 'package:yuksalish_1/pages/katalog/product_pages/product_list_create_page.dart';

import '../../../admin_pages/admin_panel_home.dart';

Widget bodyListView(context, key) {


  final size = MediaQuery.of(context).size;
  return Column(
    children: [
      SizedBox(
        height: size.height * 0.075,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Expanded(
              flex: 10,
              child: 
              InkWell(
                onTap: (){},
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.indigo),
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.indigo,
                          Colors.indigo,
                        ],
                      ),
                    ),
                    child: Shimmer(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(
                            child: Icon(Icons.speed,color: Colors.white,),
                          ),

                          Center(
                            child:  Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                  "Skoringdan o'tish",
                                  style: TextStyle(
                                      color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
              )),

            const Spacer(),
          ],
        ),
      ),

      //

      // Column(
      //   children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " Kategoriyalar ",
                  style: TextStyle(
                      color: Colors.indigo.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => AdminPanelListTask(
                          false, keyOne: key,
                          // dateController: dateController,
                          // nameController: nameController,
                        ),
                      ),
                    );
                  },
                  child:  Text(
                    " Barchasini ko'rish ",
                    style: TextStyle(
                        color: Colors.indigo.withOpacity(0.8), fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const HomeListProduct( ),
          // const ProductListFirebase(),
          // const CreateProduct(kategoriya: "Gas plita"),
        ],
      ),
    ],
  );
}
