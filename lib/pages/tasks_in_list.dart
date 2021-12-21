// ignore_for_file: camel_case_types, must_be_immutable, non_constant_identifier_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:my_to_do/Objects/taskList.dart';
import 'package:my_to_do/helpers/empty_spaces.dart';
import 'package:my_to_do/helpers/colorss.dart';
import 'package:my_to_do/helpers/task_circle.dart';
import 'package:my_to_do/pages/write_task.dart';

class tasksInOneList extends StatefulWidget {
  taskListModel oneTaskList;
  tasksInOneList(this.oneTaskList);
  @override
  _tasksInOneListState createState() => _tasksInOneListState();
}

class _tasksInOneListState extends State<tasksInOneList> {
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
            child: Column(
              children: [
                Expanded(
                    child: widget.oneTaskList.sizeListOfTasks > 0
                        ? taskListStyleInList(widget.oneTaskList.getListOfTasks,
                            widget.oneTaskList.nameList)
                        : NoLists())
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          
          onPressed: () {
              Navigator.of(context)
                  .pushNamed('/write_task',
                      arguments: taskModel(taskTopic: "", state: false))
                  .then((value) {
                setState(() {
                  // ToDo actualizar la base de datos
                });
              });
          },
          backgroundColor: my_Colors.background_color_blue,
          child: Icon(Icons.add, color: my_Colors.background_color_white,),
        
        
        
        ),
      ),
    );
  }
}

int contador = 0;

// This class return a FULL ListView of the instant tasks to the main screen
class taskListStyleInList extends StatefulWidget {
  final List<taskModel> _tasks;
  final String list_name;
  taskListStyleInList(this._tasks, this.list_name);

  @override
  State<taskListStyleInList> createState() => _taskListStyleInListState();
}

class _taskListStyleInListState extends State<taskListStyleInList> {
  final contadorStream = new StreamController<int>();
  final listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    contador =
        widget._tasks.where((element) => element.getState == false).length;
    contadorStream.sink.add(contador);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SizedBox(
        height: 10.0,
      ),

      // This row is the "AppBar" of the screen
      Row(children: [
        Expanded(
          flex: 1,
          child: new GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/list_lists');
            },
            child: Icon(Icons.arrow_back_ios_new_sharp,
                color: my_Colors.text_color_main, size: 18),
          ),
        ),
        Expanded(
          flex: 6,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.list_name,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(
                  color: my_Colors.text_color_main,
                  fontSize: 18.0,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
        ),
        Expanded(
          flex: 3,
          child: StreamBuilder(
              stream: contadorStream.stream,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                if (!snapshot.hasData) {
                  return Column(children: [
                    circle_percent(0, 60, 12),
                    SizedBox(height: 5.0),
                    Text("Nothing",
                        style: TextStyle(
                            fontSize: 14.0, color: my_Colors.tex_color_grey))
                  ]);
                } else {
                  return Column(children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    circle_percent(
                        snapshot.data! / widget._tasks.length, 60, 12),
                    SizedBox(height: 10.0),
                    Text(
                        snapshot.data.toString() +
                            " / " +
                            widget._tasks.length.toString(),
                        style: TextStyle(
                            fontSize: 10.0, color: my_Colors.tex_color_grey))
                  ]);
                }
              }),
        ),
      ]),

      SizedBox(height: 15.0),

      // It's where the tasks are created
      Expanded(
        child: AnimatedList(
          key: listKey,
          initialItemCount: widget._tasks.length,
          itemBuilder: (context, index, animation) {
            taskModel task = widget._tasks[index];
            return taskStyle(context, task, index, contadorStream, animation);
          },
        ),
      ),
    ]);
  }

  SizeTransition taskStyle(BuildContext context, taskModel task, int index,
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

                    // Check as UNDONe
                  } else {
                    contador--;
                    task.state = true;
                    undown_and_up(index);
                  }
                });

                contadorStream.sink.add(contador);

                //db_Instant_Task().updateState_MyInstantTasks(widget.index);
              },
              child: task.state
                  ? Image(
                      image: AssetImage('assets/circle.png'),
                      height: 25,
                      width: 25,
                    )
                  : Image(
                      image: AssetImage('assets/circle-check.png'),
                      height: 25,
                      width: 25,
                    ),
            ),

            SizedBox(
              width: 10.0,
            ),

            // El apartado del texto
            Expanded(
              child: new GestureDetector(
                onTap: () {
                  task.setState = true;
                  Navigator.of(context)
                      .pushNamed('/write_task', arguments: task);
                },
                child: Expanded(
                  child: Container(
                    decoration: new BoxDecoration(
                        color: my_Colors.background_color_task,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0))),

                    // TEXT
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      child: Text(
                        task.taskTopic,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 14.0,
                            color: Color(0xff202B57),
                            textStyle: task.state
                                ? TextStyle(decoration: TextDecoration.none)
                                : TextStyle(
                                    decoration: TextDecoration.lineThrough)),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void done_and_down(int i) {
    taskModel taskk = widget._tasks[i];
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

  void undown_and_up(int i) {
    taskModel taskk = widget._tasks[i];
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
