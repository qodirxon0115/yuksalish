import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:yuksalish_1/pages/home/widgets/home/task_list_widget/task_list_do_data.dart';
import 'package:yuksalish_1/pages/home/widgets/home/task_list_widget/task_list_not_data.dart';

import '../../../../../model/data/database_helpaer.dart';
import '../../../../../model/data/task.dart';
import '../../../../../model/provider/model_pv.dart';

Widget tasksList(context, bool allList) {


  final viewModel = Provider.of<MainProvider>(context);
  Timer(Duration(seconds: 2), () {
    viewModel.isLoading = false;
  });
  return SizedBox(
      height: !allList
          ? MediaQuery.of(context).size.height * 0.9
          : MediaQuery.of(context).size.height,
      child: Consumer<MainProvider>(builder: (context, data, child) {
        return StreamBuilder(
            stream: DatabaseHelper.intance.getTasks().asStream(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
              return snapshot.data != null
                  ? taskListDoDataItem(allList,snapshot)
                  : taskListNotData(allList);
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircularProgressIndicator(),
                ],
              );
            });

      }));
}
