import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/data/database_helpaer.dart';
import '../../model/data/task.dart';
import '../../model/provider/model_pv.dart';
import '../home/widgets/home/task_list.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem(this.task, {Key? key}) : super(key: key);

  void updateTaskList(context) async {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    mainProvider.updateTaskList();
  }

  void deleteTask(context)async{
   await DatabaseHelper.intance.delete(task.id!);
   updateTaskList(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(child: tasksList(context,false));
  }
}
