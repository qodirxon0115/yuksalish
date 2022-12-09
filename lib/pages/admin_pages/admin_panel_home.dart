import 'dart:async';

import 'package:flutter/material.dart';
import '../../model/data/database_helpaer.dart';
import '../../model/data/task.dart';

import 'package:provider/provider.dart';

import '../../model/provider/model_pv.dart';
import '../home/widgets/home/task_list.dart';

class AdminPanelListTask extends StatefulWidget {
  const AdminPanelListTask({Key? key}) : super(key: key);

  @override
  State<AdminPanelListTask> createState() => _AdminPanelListTaskState();
}

class _AdminPanelListTaskState extends State<AdminPanelListTask> {
  void updateTaskList(context) async {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    mainProvider.updateTaskList();
  }

  void deletaeTask(context) async {
    final mainProvider = Provider.of<MainProvider>(
      context,
    );

    await DatabaseHelper.intance.delete(mainProvider.task.id!);
    updateTaskList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: tasksList(context));
  }
}

class AdminPanelCreateTask extends StatefulWidget {
  Task? task;

  AdminPanelCreateTask({this.task, Key? key}) : super(key: key);

  @override
  State<AdminPanelCreateTask> createState() => _AdminPanelCreateTaskState();
}

class _AdminPanelCreateTaskState extends State<AdminPanelCreateTask> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController charactericticController =
      TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  void updateTask() async {}
  bool onpressed = false;

  @override
  Widget build(BuildContext context) {
    // Widget form() {
    //
    //   return
    //        ListView.builder(
    //                   scrollDirection: Axis.horizontal,
    //                   itemCount: list.length,
    //                   padding: const EdgeInsets.only(bottom: 10),
    //                   itemBuilder: (context, index) {
    //                     return TextFormField(
    //                       controller: listController[index],
    //                       style:
    //                           const TextStyle(color: Colors.white, fontSize: 30),
    //                       decoration: InputDecoration(
    //                         enabledBorder: const UnderlineInputBorder(
    //                           borderSide: BorderSide(color: Colors.white),
    //                         ),
    //                         labelText: list[index],
    //                         fillColor: Colors.white,
    //                         labelStyle: const TextStyle(
    //                             color: Colors.white,
    //                             fontSize: 20,
    //                             letterSpacing: 3),
    //                       ),
    //
    //                       // const SizedBox(
    //                       //   height: 14,
    //                       // ),
    //                       // TextFormField(
    //                       //   controller: dateController,
    //                       //   style: const TextStyle(color: Colors.white, fontSize: 30),
    //                       //   decoration: const InputDecoration(
    //                       //     enabledBorder: UnderlineInputBorder(
    //                       //       borderSide: BorderSide(color: Colors.white),
    //                       //     ),
    //                       //     labelText: "Date",
    //                       //     fillColor: Colors.white,
    //                       //     labelStyle: TextStyle(
    //                       //         color: Colors.white, fontSize: 20, letterSpacing: 3),
    //                       //   ),
    //                       // )
    //                     );
    //                   },
    //                   // itemCount: snapshot.data?.length ?? 0,
    //
    //
    //
    //
    //       );
    // }
    List listController = [
      titleController,
      descriptionController,
      priceController,
      charactericticController,
      categoryController,
    ];
    List list = [
      "Name",
      "Description",
      "Price",
      "Characterictic",
      "Category",
    ];
    return Scaffold(
        body: Container(
          decoration:  BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff9C2CF3), Color(0xff3A49F9)],
                begin: FractionalOffset(1.0, 0.0),
                end: FractionalOffset(1.0, 1.0),
                tileMode: TileMode.clamp),
          ),
          child: CustomScrollView(
      slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              color: const Color(0xff3A49F9),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    // height: 300,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff9C2CF3), Color(0xff3A49F9)],
                          begin: FractionalOffset(1.0, 0.0),
                          end: FractionalOffset(1.0, 1.0),
                          tileMode: TileMode.clamp),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  size: 32,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 64,
                              ),
                              Text(
                                widget.task == null
                                    ? 'Create a Task'
                                    : 'Update a task',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const SizedBox(
                                width: 64,
                              ),
                              const Icon(
                                Icons.search,
                                size: 32,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  //   ),
                  // )
                ],
              ),
            ),
          ])),
          SliverList(

              delegate:
              SliverChildBuilderDelegate(
                      childCount: listController.length,
                      (BuildContext contex, int index) {
            return

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: listController[index],
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                  decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: list[index],
                    fillColor: Colors.white,
                    labelStyle: const TextStyle(
                        color: Colors.white, fontSize: 20, letterSpacing: 3),
                  ),

                  // const SizedBox(
                  //   height: 14,
                  // ),
                  // TextFormField(
                  //   controller: dateController,
                  //   style: const TextStyle(color: Colors.white, fontSize: 30),
                  //   decoration: const InputDecoration(
                  //     enabledBorder: UnderlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.white),
                  //     ),
                  //     labelText: "Date",
                  //     fillColor: Colors.white,
                  //     labelStyle: TextStyle(
                  //         color: Colors.white, fontSize: 20, letterSpacing: 3),
                  //   ),
                  // )

            ),
              );
          })),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff9C2CF3), Color(0xff3A49F9)],
                    begin: FractionalOffset(1.0, 0.0),
                    end: FractionalOffset(1.0, 1.0),
                    tileMode: TileMode.clamp),
              ),
              child: TextButton(

                onPressed: () {
                  if (titleController.text != "" &&
                      descriptionController.text != "" &&
                      priceController.text != "" &&
                      charactericticController.text != "" &&
                      categoryController.text != "") {
                    createTask();
                    updateTask();
                    setState(() {
                      onpressed = true;
                    });
                    // _initTimer(Widget child){
                    Timer(const Duration(seconds: 1), () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const AdminPanelListTask(
                                  // dateController: dateController,
                                  // nameController: nameController,
                                  ),
                        ),
                      );
                    });
                  }
                },

                // },
                child: Center(
                  child: onpressed == true
                      ? const CircularProgressIndicator()
                      : Text(
                          widget.task == null ? 'Create task' : 'Update task',
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        ),
                ),
              ),
            ),
          ]))
      ],
    ),
        ));
  }

  void createTask() {
    Task newTask = Task(
        titleController.text,
        descriptionController.text,
        priceController.text,
        charactericticController.text,
        categoryController.text);

    var res = DatabaseHelper.intance.insert(newTask);
    print(res);
  }
}