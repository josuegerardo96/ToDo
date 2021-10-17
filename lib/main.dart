// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:async';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_to_do/ListStyle/task_list.dart';
import 'package:my_to_do/DB/db_instant_task.dart';
import 'package:my_to_do/DB/db_list_tasks.dart';
import 'package:my_to_do/ListStyle/list_of_lists_main.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:my_to_do/Objects/taskList.dart';
import 'package:my_to_do/helpers/my_style.dart';
import 'package:my_to_do/helpers/route_generators.dart';
import 'visual/main_visual.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,

    // main route of the app
    initialRoute: '/',
    // In the file "route_generates" are all the routes used in the app
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}

// Starts the code for the main screen
class main_screen extends StatefulWidget {
  @override
  _main_screenState createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  List<taskModel> MyinstantTasksList = [];
  List<taskListModel> MytaskListList = [];


  @override
  void initState() {
    super.initState();
    MyinstantTasksList = startDB();
    MytaskListList = db_list_tasks().start_myListOfTasks();

    

  }

  @override
  Widget build(BuildContext context) {
    // Change statusBar color
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: my_Colors.main_color));

    return Scaffold(
      //start the screen
      body: SafeArea(
        child: Container(
          color: my_Colors.background_color_white,
          child: Column(
            // The full column will take all the space in the screen
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              title(),
              line_text("Lists", "0 lists"),

              // LIST OF LISTS
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Row(
                  children: <Widget>[
                    // When there are lists
                    Expanded(
                        child: MytaskListList.length > 0
                            ? ListOfListsStyle(MytaskListList)
                            : no_lists()),
                  ],
                ),
              ),


              // INSTANT TASKS
              Expanded(
                  child: MyinstantTasksList.length > 0
                      ? taskListStyle(MyinstantTasksList)
                      : no_instant_tasks())
            ],
          ),
        ),
      ),

      floatingActionButton: FabCircularMenu(
        fabOpenIcon: Icon(Icons.add, color: my_Colors.background_color_white),
        fabCloseIcon:
            Icon(Icons.close, color: my_Colors.background_color_white),
        ringColor: Colors.transparent,
        fabMargin: EdgeInsets.all(20.0),
        ringWidth: MediaQuery.of(context).size.width * 0.9,
        children: <Widget>[
          IconButton(
              onPressed: () =>
                  {_goTo_write_tasks(taskModel(taskTopic: "", state: false))},
              icon: Icon(
                Icons.edit,
                color: my_Colors.text_color_main,
              )),

          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("All done tasks removed"),
                  duration: const Duration(seconds: 3),
                ));

                setState(() {
                  MyinstantTasksList.removeWhere((t) => t.getState == false);
                });
              },
              icon: Icon(Icons.delete, color: my_Colors.text_color_main)),

          // ToDo Pantalla para crear listas
          IconButton(
              onPressed: () => {_goTo_list_of_lists(context)},
              icon: Icon(Icons.list, color: my_Colors.text_color_main)),
        ],
      ),
    );
  }

  // It goes to the list of lists
  void _goTo_list_of_lists(BuildContext context) {
    Navigator.popAndPushNamed(context, "/list_lists");
  }

  // It goes to write a task in the instant tasks
  void _goTo_write_tasks(taskModel task) {
    Navigator.of(context).popAndPushNamed('/write_task', arguments: task);
  }

  List<taskModel> startDB() {
    db_Instant_Task db = new db_Instant_Task();
    return db.read_MyInstantTasks();
  }
}
