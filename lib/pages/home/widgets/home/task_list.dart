
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/data/database_helpaer.dart';
import '../../../../model/data/task.dart';
import '../../../../model/provider/model_pv.dart';
Widget tasksList(context) {
  return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Consumer<MainProvider>(builder: (context, data, child) {
        return FutureBuilder(
            future: DatabaseHelper.intance.getTasks(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
              return GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: snapshot.data!.length,
                padding: const EdgeInsets.only(bottom: 10),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18)),
                        child: Image.asset(
                          "assets/images/image_1.png",
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                  child: Text(
                                      snapshot.data![index].title.toString())),
                              Container(
                                  child: Text(
                                      snapshot.data![index].title.toString())),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Container(
                                  child: Text(
                                      snapshot.data![index].title.toString())),
                              Container(
                                  child: Text(
                                      snapshot.data![index].title.toString())),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
                // itemCount: snapshot.data?.length ?? 0,
              );
            });
      }));
}
