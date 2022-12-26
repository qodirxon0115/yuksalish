import 'package:flutter/material.dart';
import 'package:yuksalish_1/pages/home/widgets/home/task_list_widget/task_list.dart';

import '../../../admin_pages/admin_panel_home.dart';


Widget bodyListView(context,key) {
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                         AdminPanelListTask(true,keyOne: key,
                          // dateController: dateController,
                          // nameController: nameController,
                        ),
                      ),
                    );
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
          tasksList(context,false),
        ],
      ),
    ],
  );
}

