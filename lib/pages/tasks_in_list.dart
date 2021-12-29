// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:my_to_do/Objects/taskList.dart';
import 'package:my_to_do/helpers/Colors/randomColors.dart';
import 'package:my_to_do/helpers/buttons.dart';
import 'package:my_to_do/helpers/empty_spaces.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';
import 'package:my_to_do/helpers/task_circle.dart';
import 'package:my_to_do/helpers/texts.dart';
import 'package:my_to_do/pages/write_list.dart';
import 'package:my_to_do/pages/write_task.dart';

class tasksInOneList extends StatefulWidget {
  TaskList oneTaskList;
  tasksInOneList(this.oneTaskList);
  @override
  _tasksInOneListState createState() => _tasksInOneListState();
}

class _tasksInOneListState extends State<tasksInOneList> {
  @override
  void initState() {
    super.initState();
    widget.oneTaskList.ListOfTasks.sort((a, b) {
      if (a.getState == true) {
        return -1;
      } else {
        return 1;
      }
    });
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
            color: my_Colors.white,
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: widget.oneTaskList.sizeListOfTasks > 0
                            ? taskListStyleInList(
                                widget.oneTaskList.getListOfTasks,
                                widget.oneTaskList.nameList)
                            : NoLists()),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

int contador = 0;

//-------------------------------
// CREATE TASK LIST
//-------------------------------
class taskListStyleInList extends StatefulWidget {
  List<Task> _tasks;
  String list_name;
  taskListStyleInList(this._tasks, this.list_name);

  @override
  State<taskListStyleInList> createState() => _taskListStyleInListState();
}

class _taskListStyleInListState extends State<taskListStyleInList> {
  final contadorStream = new StreamController<int>();
  final listKey = GlobalKey<AnimatedListState>();
  Color selCol = R_Colors().listOfRColors()[Random().nextInt(10)];

  @override
  Widget build(BuildContext context) {
    contador =
        widget._tasks.where((element) => element.getState == false).length;
    contadorStream.sink.add(contador);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SizedBox(
        height: 20.0,
      ),

      // First line
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(children: [
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: my_Colors.black,
                size: 18,
              )),
          Spacer(),
          PopupMenuButton(
              icon: Icon(
                Icons.more_vert_outlined,
                color: my_Colors.black,
                size: 18,
              ),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                      value: 1,
                      onTap: _clean_done_tasks,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.delete_sweep_outlined,
                            color: my_Colors.red,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Delete all complete tasks"),
                        ],
                      )),
                ];
              })
        ]),
      ),

      SizedBox(
        height: 5,
      ),

      // list name and circle
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
              side: BorderSide(
            color: my_Colors.light_grey,
            width: 1,
          )),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(children: <Widget>[
              StreamBuilder(
                  stream: contadorStream.stream,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    if (!snapshot.hasData) {
                      return Column(children: [
                        Circle_Counter8(0, 85, 12, selCol),
                        SizedBox(height: 5.0),
                        counter_text_normal('0', '0', 14, selCol),
                      ]);
                    } else {
                      return Column(children: [
                        SizedBox(
                          height: 15.0,
                        ),

                        widget._tasks.length != 0 ?
                        Circle_Counter8(snapshot.data! / widget._tasks.length,
                            85, 16, selCol):
                        Circle_Counter8(0,
                            85, 16, selCol)
                        ,

                        SizedBox(height: 10.0),
                        counter_text_normal(snapshot.data.toString(),
                            widget._tasks.length.toString(), 12, selCol),
                      ]);
                    }
                  }),
              SizedBox(
                width: 35,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: GestureDetector(
                      onLongPress: () => _changeNameOfList(),
                      child: Title18_2(widget.list_name)),
                ),
              ),
            ]),
          ),
        ),
      ),

      SizedBox(height: 20.0),

      // It's where the tasks are created
      Expanded(
        child: Stack(
          children: [


  

            AnimatedList(
              key: listKey,
              padding: EdgeInsets.only(
                  left: 2, bottom: kFloatingActionButtonMargin + 60),
              initialItemCount: widget._tasks.length,
              itemBuilder: (context, index, animation) {
                Task task = widget._tasks[index];
                return taskStyle(context, task, index, contadorStream, animation);
              },
            ),

            if(widget._tasks.length == 0)...[Center(child: NotaksInList())],

            
            Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      // Write a new task
                      _go_to_writeTask();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: float_button(
                          "Add task",
                          Icon(
                            Icons.add,
                            color: my_Colors.white,
                            size: 20,
                          ),
                          my_Colors.green,
                          50,
                          120,
                          10),
                    ),
                  ),
                ),


          ],
        ),
      ),
    ]);
  }

  
  // Design task by task
  SizeTransition taskStyle(BuildContext context, Task task, int index,
      StreamController contadorStream, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, top: 10.0),
        child: Row(
          children: <Widget>[
            // Button for check the state of the task
            new GestureDetector(
                onTap: () {
                  setState(() {
                    if (task.state == true) {
                      contador++;
                      task.state = false;
                      done_and_down(index);

                      if(contador == widget._tasks.length && contador != 0){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: celebration() ,
                        duration: const Duration(seconds: 3),
                      ));
                      }

                      // Check as UNDONe
                    } else {
                      contador--;
                      task.state = true;
                      undown_and_up(index);
                    }
                  });

                  contadorStream.sink.add(contador);
                },
                child: task.state!
                    ? Icon(
                        Icons.check_box_outline_blank_sharp,
                        color: my_Colors.deep_grey,
                      )
                    : Icon(
                        Icons.check_box_sharp,
                        color: my_Colors.green,
                      )),

            SizedBox(
              width: 10.0,
            ),

            // El apartado del texto
            Expanded(
              child: new GestureDetector(
                onTap: () async {


                  String new_task_topic = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Write_Task(task: task.getTaskTopic!)));
                  
                  if(new_task_topic != ""){
                    setState(() {
                      task.setTaskTopic = new_task_topic;
                    });
                  }

                  
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  child: task.getState!
                      ? task_text14(task.getTaskTopic!)
                      : task_text14_done(task.getTaskTopic!),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



  //-------------------------------------------------
  // Functions for list:
  // change name
  // adding, erasing and clean the list
  //--------------------------------------------------

  _go_to_writeTask() async {
    String task_name = await Navigator.push(
      context, 
      MaterialPageRoute(builder: 
      (context)=> Write_Task(task: "")));

      if(task_name != ""){
        setState(() {
          insert_task(Task(taskTopic: task_name, state: true));
        });
      } 
  }

  void _changeNameOfList() async {
    String new_name = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => write_List(
                  NameList: widget.list_name,
                )));

    if(new_name != ""){
      setState(() {
        widget.list_name = new_name;
      });
    }
  }

  _clean_done_tasks() {
    setState(() {
      for (int i = 0; i < widget._tasks.length; i++) {
        setState(() {
          if (widget._tasks[i].getState == false) {
            Task taskk = widget._tasks[i];
            widget._tasks.removeAt(i);
            listKey.currentState!.removeItem(
              i,
              (context, animation) =>
                  taskStyle(context, taskk, i, contadorStream, animation),
              duration: Duration(milliseconds: 100),
            );

            i--;
          }
        });
      }
    });
  }

  void done_and_down(int i) {
    Task taskk = widget._tasks[i];
    widget._tasks.removeAt(i);
    listKey.currentState!.removeItem(
        i,
        (context, animation) =>
            taskStyle(context, taskk, i, contadorStream, animation),
        duration: Duration(milliseconds: 500));

    final newIndex = widget._tasks.length;
    widget._tasks.insert(newIndex, taskk);
    listKey.currentState!
        .insertItem(newIndex, duration: Duration(milliseconds: 500));
  }

  void insert_task(Task taskk){
    widget._tasks.insert(0, taskk);
    listKey.currentState!.insertItem(0, duration: Duration(milliseconds: 500)); 
  }

  void undown_and_up(int i) {
    Task taskk = widget._tasks[i];
    widget._tasks.removeAt(i);
    listKey.currentState!.removeItem(
        i,
        (context, animation) =>
            taskStyle(context, taskk, i, contadorStream, animation),
        duration: Duration(milliseconds: 500));

    widget._tasks.insert(0, taskk);
    listKey.currentState!.insertItem(0, duration: Duration(milliseconds: 500));
  }
}
