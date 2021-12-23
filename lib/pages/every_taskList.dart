// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:my_to_do/Objects/taskList.dart';
import 'package:my_to_do/helpers/task_circle.dart';
import 'package:my_to_do/helpers/empty_spaces.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';
import 'package:my_to_do/DB/db_list_tasks.dart';
import 'package:my_to_do/helpers/titles.dart';

class every_taskList extends StatefulWidget {
  @override
  State<every_taskList> createState() => _every_taskListState();
}



class _every_taskListState extends State<every_taskList> {

  // Fill every-List of tasks
  List<TaskList> myLists = [];

  // Start every-List of tasks
  @override
  void initState() {
    super.initState();
    myLists = db_list_tasks().start_myListOfTasks();
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.of(context).pop();
        return true;

      },
      child: Scaffold(
        body: SafeArea(
            child: Container(
          color: my_Colors.background_color_white,
          child: Column(
            children: <Widget>[
              // TITLE
              new GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, "/");
                  },
                  child: title()),
    
              // COUNT THE LISTS
              line_text("Lists", myLists.length.toString() + " lists"),
    
              SizedBox(height: 20.0),
              
              // SHOW EVERY-TASKLIST
              Expanded(
                  child: myLists.length > 0
                      ? ListView.builder(
                          itemCount: myLists.length,
                          itemBuilder: (context, index) {
                            TaskList list = myLists[index];
                            return every_taskList_Style(list, index, context);},)
                      : NoLists()),
            ],
          ),
        )),
    
    
        // FAB Button
        floatingActionButton: FabCircularMenu(
          fabOpenIcon: Icon(Icons.add, color: my_Colors.background_color_white),
          fabCloseIcon:
              Icon(Icons.close, color: my_Colors.background_color_white),
          ringColor: Colors.transparent,
          fabMargin: EdgeInsets.all(20.0),
          ringWidth: MediaQuery.of(context).size.width * 0.9,
          children: <Widget>[
            // Create a new List
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/write_list",
                      arguments: TaskList(nameList: "", ListOfTasks: [])).then((value){setState(() {
                        // ToDo actualizar la lista con los cambios que se hayan hecho


                      });});
                },
                icon: Icon(
                  Icons.add,
                  color: my_Colors.text_color_main,
                )),
    
            // Delete all lists completes
            IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("All list completed removed"),
                    duration: const Duration(seconds: 3),
                  ));
    
                  setState(() {
                    myLists.removeWhere((e) => e.allDoneInList == 0);
                  });
                },
                icon: Icon(Icons.delete, color: my_Colors.text_color_main)),
          ],
        ),
      ),
    );
  }
}




//-------------------------------
// VISUAL: CREATE EVERY TASKLIST
//-------------------------------
Container every_taskList_Style(TaskList myLists, int index, BuildContext context){
  List<Task> lista = myLists.ListOfTasks;
  int allDone = lista.where((e) => e.getState == false).length;

  return Container(
    height: 150.0,
    margin: EdgeInsets.symmetric(horizontal: 10.0),
    child: new GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed("/tasks_in_list", arguments: myLists);
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: my_Colors.background_color_task,
        elevation: 0.2,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 7,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          myLists.getNameList,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: GoogleFonts.roboto(
                            fontSize: 18.0,
                            color: my_Colors.text_color_main,
                            textStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    circle_percent(
                        allDone / myLists.sizeListOfTasks, 60.0, 12.0),
                    SizedBox(height: 10.0),
                    Text(
                      allDone.toString() +
                          " / " +
                          myLists.sizeListOfTasks.toString(),
                      style: GoogleFonts.roboto(
                          color: my_Colors.tex_color_grey, fontSize: 12),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );

}
