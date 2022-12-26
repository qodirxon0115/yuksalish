import 'package:flutter/material.dart';
import 'package:yuksalish_1/pages/home/widgets/home/task_list_widget/task_list.dart';

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
                          Colors.white12,
                          Colors.indigo,
                        ],
                      ),
                    ),
                    child: const Center(
                      child:  Text(
                          "Skoringdan o'tish",
                          style: TextStyle(
                              color: Colors.indigo, fontWeight: FontWeight.bold),
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
                          true, keyOne: key,
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
          tasksList(context, false),
        ],
      ),
    ],
  );
}
