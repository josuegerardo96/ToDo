// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/Objects/taskList.dart';
import 'package:my_to_do/helpers/Colors/randomColors.dart';
import 'package:my_to_do/helpers/buttons.dart';
import 'package:my_to_do/helpers/task_circle.dart';
import 'package:my_to_do/helpers/empty_spaces.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';
import 'package:my_to_do/helpers/texts.dart';
import 'package:my_to_do/DB/lists_firebase.dart';

class every_taskList extends StatefulWidget {
  @override
  State<every_taskList> createState() => _every_taskListState();
}

class _every_taskListState extends State<every_taskList> {
  List<TaskList> myLists = [];
  TextEditingController text_list = new TextEditingController();


  @override
  void initState() {
    super.initState();
    getLists();
  }

  getLists() async {
    myLists = await Lists_firebase().getAllLists();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
            child: Container(
          color: my_Colors.background_color_white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                child: Row(
                  children: <Widget>[
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: my_Colors.black,
                          size: 20,
                        )),
                    Title20("Lists of tasks"),
                    Spacer(),
                    PopupMenuButton(
                        icon: Icon(
                          Icons.more_vert_outlined,
                          color: my_Colors.black,
                        ),
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                                value: 1,
                                onTap: _clean_done_lists,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.delete_sweep_outlined,
                                      color: my_Colors.red,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Delete all complete lists"),
                                  ],
                                )),
                          ];
                        }),
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 35,
                    width: 220,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: my_Colors.light_grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: text_list,
                      onChanged: (_) => setState(() {}),
                      cursorColor: my_Colors.green,
                      maxLength: 40,
                      decoration: InputDecoration(
                        counterText: '',
                        contentPadding: EdgeInsets.only(bottom: 17.5),
                        border: InputBorder.none,
                        hintText: "Add a new list",
                        hintStyle: GoogleFonts.roboto(
                          fontSize: 14,
                          color: my_Colors.light_grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onLongPress: (){setState(() {
                        
                        
                        
                        
                      });},
                      onTap: () {
                        TaskList tl = TaskList(
                            nameList: text_list.text.trim(), ListOfTasks: []);
                        myLists.insert(0, tl);

                        setState(() {});
                        Lists_firebase().CreateList(text_list.text.trim());
                        text_list.text = "";
                      },
                      child: add_list_button()),
                ],
              ),

              SizedBox(
                height: 5,
              ),

              Align(
                  alignment: Alignment.center,
                  child: little_text_word_counter(
                      text_list.text.length.toString(), "40")),

              SizedBox(
                height: 40,
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38.0),
                  child: myLists.length == 0
                      ? NoLists()
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 150,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: myLists.length,
                          itemBuilder: (context, index) {
                            return cardList(myLists[index], index);
                          }),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  _clean_done_lists() {
    setState(() {
      myLists.removeWhere((e) {

        if(e.allDoneInList == e.sizeListOfTasks){
          Lists_firebase().DeleteList(e.getNameList);
          return e.allDoneInList == e.sizeListOfTasks;
        }
        return false;
      });
    });
  }

  //-------------------------------
  // VISUAL: CREATE EVERY CARD LIST
  //-------------------------------
  Container cardList(TaskList taskList, int index) {
    Color selCol = R_Colors().listOfRColors()[index % 10];

    return Container(
        height: 150,
        width: 150,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed("/tasks_in_list", arguments: taskList)
                .then((value) {
              setState(() {
                // ToDo actualizar la lista con los cambios realizados
              });
            });
          },
          onLongPress: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Do you want to remove this list?"),
              duration: const Duration(seconds: 4),
              action: SnackBarAction(
                textColor: my_Colors.green,
                label: "Yes",
                onPressed: () {
                  setState(() {
                    Lists_firebase().DeleteList(myLists[index].nameList!);
                    myLists.removeAt(index);
                  });
                },
              ),
            ));
          },
          child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                color: my_Colors.light_grey,
                width: 1,
              )),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(children: <Widget>[
                    // Row of counter and Circle
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 1.0, vertical: 1),
                      child: Row(
                        children: [
                          taskList.sizeListOfTasks == 0
                              ? Circle_Counter(0, 50, 10, selCol)
                              : Circle_Counter(
                                  taskList.allDoneInList /
                                      taskList.sizeListOfTasks,
                                  50,
                                  10,
                                  selCol),
                          SizedBox(
                            width: 20,
                          ),
                          counter_text_normal(taskList.allDoneInList.toString(),
                              taskList.sizeListOfTasks.toString(), 10, selCol),
                        ],
                      ),
                    ),

                    Spacer(
                      flex: 1,
                    ),

                    // List title
                    Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: little_text(taskList.getNameList),
                    ),
                  ]))),
        ));
  }
}
