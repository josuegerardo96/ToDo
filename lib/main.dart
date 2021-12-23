// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_to_do/DB/db_instant_task.dart';
import 'package:my_to_do/DB/db_list_tasks.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:my_to_do/Objects/taskList.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';
import 'package:my_to_do/helpers/Colors/randomColors.dart';
import 'package:my_to_do/helpers/buttons.dart';
import 'package:my_to_do/helpers/texts.dart';
import 'package:my_to_do/helpers/route_generators.dart';
import 'package:my_to_do/helpers/task_circle.dart';
import 'helpers/empty_spaces.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/', // main route of the app
    onGenerateRoute: RouteGenerator
        .generateRoute, // In the file "route_generates" are all the routes used in the app
  ));

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: my_Colors.black,
  ));
}

//------------------------------------------
// this file has:
//    List of every-taskList
//    List of instant tasks
//------------------------------------------

class main_screen extends StatefulWidget {
  @override
  _main_screenState createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  // Fill the list with the tasks and lists of DB
  List<Task> MyinstantTasksList = [];
  List<TaskList> MytaskListList = [];

  // Start to fill the lists
  @override
  void initState() {
    super.initState();
    MyinstantTasksList = db_Instant_Task().read_MyInstantTasks();
    MytaskListList = db_list_tasks().start_myListOfTasks();
  }

  @override
  Widget build(BuildContext context) {
    // Change statusBar color
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: my_Colors.black));

    // Create the Main screen's body
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: my_Colors.background_color_white,
          child: Stack(
            children: [
              Column(
                // The full column will take all the space in the screen
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),

                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(children: [
                      Expanded(child: Main_title()),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            color: my_Colors.black,
                          )),
                    ]),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  // Title of lists
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(children: [
                      Expanded(child: Title18("List of tasks")),
                      little_text_counter(MytaskListList.length.toString()),
                    ]),
                  ),

                  SizedBox(
                    height: 18,
                  ),

                  // LIST OF LISTS
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: <Widget>[
                        // When there are lists
                        Expanded(
                            child: MytaskListList.length > 0
                                ? every_taskList_in_main(MytaskListList)
                                : NoListsInMain()),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  // INSTANT TASKS
                  Expanded(
                      child: MyinstantTasksList.length > 0
                          ? taskListStyle(MyinstantTasksList)
                          : NoInstantTasks())
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    // Write a new task
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
                        my_Colors.green),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//--------------------------------------
//VISUAL
//--------------------------------------

//-------------------------------
// EVERY-TASKlIST
//-------------------------------
class every_taskList_in_main extends StatelessWidget {
  final List<TaskList> ListOfLists;
  every_taskList_in_main(this.ListOfLists);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0,
      child: ListView.builder(
        itemCount: ListOfLists.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          TaskList taskList = ListOfLists[index];
          return everyTaskListInMain(
              taskList, index, ListOfLists[index].sizeListOfTasks);
        },
      ),
    );
  }
}

class everyTaskListInMain extends StatefulWidget {
  final TaskList taskList;
  int index;
  int contador;
  everyTaskListInMain(this.taskList, this.index, this.contador);

  @override
  _everyTaskListInMaineState createState() => _everyTaskListInMaineState();
}

class _everyTaskListInMaineState extends State<everyTaskListInMain> {
  //Expanded
  @override
  Widget build(BuildContext context) {
    Color selCol = R_Colors().listOfRColors()[widget.index % 10];

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed("/tasks_in_list", arguments: widget.taskList)
            .then((value) {
          setState(() {
            // ToDo actualizar la lista con los cambios realizados
          });
        });
      },
      child: Container(
        width: 150.0,
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: BorderSide(
                color: my_Colors.light_grey,
                width: 1,
              )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: <Widget>[
                // List title
                Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.centerLeft,
                    child: little_text(widget.taskList.getNameList)),

                Spacer(
                  flex: 1,
                ),

                // Row of counter and Circle
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: counter_text(
                              widget.taskList.allDoneInList.toString(),
                              widget.taskList.sizeListOfTasks.toString(),
                              10,
                              selCol),
                        ),
                      ),
                      Circle_Counter(
                          widget.taskList.allDoneInList /
                              widget.taskList.sizeListOfTasks,
                          40,
                          10.0,
                          selCol),
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
}

//-------------------------------
// INSTANT TASK LIST CLASS
//-------------------------------
int contador = 0;

// This class return a FULL ListView of the instant tasks to the main screen
class taskListStyle extends StatefulWidget {
  List<Task> _tasks;
  taskListStyle(this._tasks);
  @override
  State<taskListStyle> createState() => _taskListStyleState();
}

class _taskListStyleState extends State<taskListStyle>
    with SingleTickerProviderStateMixin {
  final contadorStream = new StreamController<int>();
  final listKey = GlobalKey<AnimatedListState>();

  @override
  void dispose() {
    contadorStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    contador =
        widget._tasks.where((element) => element.getState == false).length;
    contadorStream.sink.add(contador);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      StreamBuilder(
          stream: contadorStream.stream,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(children: [
                Expanded(child: Title18("Simple tasks")),
                counter_text(
                  snapshot.data.toString(),
                  widget._tasks.length.toString(),
                  12,
                  my_Colors.green,
                ),
              ]),
            );
          }),
      SizedBox(height: 15.0),
      Expanded(
        child: AnimatedList(
          key: listKey,
          padding: EdgeInsets.only(bottom: kFloatingActionButtonMargin + 60),
          initialItemCount: widget._tasks.length,
          itemBuilder: (context, index, animation) {
            return taskStyle(this.context, widget._tasks[index], index,
                contadorStream, animation);
          },
        ),
      ),
    ]);
  }

  // Give a task for being create
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
                onTap: () {
                  task.setState = true;
                  Navigator.of(context)
                      .pushNamed('/write_task', arguments: task)
                      .then((value) {
                    setState(() {
                      //ToDo actualizar la base de datos
                    });
                  });
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  child: task.getState
                      ? task_text16(task.getTaskTopic)
                      : task_text16_done(task.getTaskTopic),
                ),
              ),
            )
          ],
        ),
      ),
    );
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
