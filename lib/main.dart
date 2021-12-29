// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import 'package:my_to_do/DB/db_list_tasks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_to_do/DB/instant_firebase.dart';
import 'package:my_to_do/Log/google_sign_in.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:my_to_do/Objects/taskList.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';
import 'package:my_to_do/helpers/Colors/randomColors.dart';
import 'package:my_to_do/helpers/buttons.dart';
import 'package:my_to_do/helpers/texts.dart';
import 'package:my_to_do/helpers/route_generators.dart';
import 'package:my_to_do/helpers/task_circle.dart';
import 'package:my_to_do/pages/write_task.dart';
import 'package:provider/provider.dart';
import 'helpers/empty_spaces.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: new MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/Log_In_page', // main route of the app
      onGenerateRoute: RouteGenerator
          .generateRoute, // In the file "route_generates" are all the routes used in the app
    ),
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

class _main_screenState extends State<main_screen> with SingleTickerProviderStateMixin {
  // Fill the list with the tasks and lists of DB
  // List<Task> MyinstantTasksList = [];
  List<TaskList> MytaskListList = [];
  final contadorStream = new StreamController<int>();

  @override
  void dispose() {
    contadorStream.close();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();

    MytaskListList = db_list_tasks().start_myListOfTasks();
    
  }


  @override
  Widget build(BuildContext context) {
    // Change statusBar color
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: my_Colors.black));

    // Create the Main screen's body
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: my_Colors.background_color_white,
            child: Column(
              // The full column will take all the space in the screen
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),

                // Title
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(children: [
                    Expanded(child: Main_title()),

                    // IconButton(onPressed: (){
                    //   Navigator.popAndPushNamed(context, '/Log_In_page');
                    // }, icon: Icon(Icons.more_vert_sharp, color: my_Colors.black,)),

                    PopupMenuButton(
                        onSelected: (v) {
                          if (v == 0) {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.logout();
                          }
                        },
                        icon: Icon(Icons.more_vert_sharp),
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                                value: 0,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.logout_sharp,
                                      color: my_Colors.deep_grey,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    task_text14("Logout"),
                                  ],
                                )),
                          ];
                        })
                  ]),
                ),

                SizedBox(
                  height: 20,
                ),

                // Title of lists
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/list_lists"),
                    child: Row(children: [
                      Title18("List of tasks"),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: R_Colors.green,
                      ),
                      Spacer(),
                      little_text_counter_normal(
                          MytaskListList.length.toString()),
                    ]),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // LIST OF LISTS
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // When there are lists
                      MytaskListList.length > 0
                          ? Expanded(
                              child: every_taskList_in_main(MytaskListList))
                          : Center(child: NoListsInMain()),
                    ],
                  ),
                ),

                SizedBox(
                  height: 25,
                ),

                // INSTANT TASKS
                Expanded(child: taskListStyle())
              ],
            ),
          ),
        ),
      ),
    );
  }




}

//----------------------------------------------------------------------------
//VISUAL
//----------------------------------------------------------------------------

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
                    child: little_text_counter_normal(
                        widget.taskList.getNameList)),

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
                          child: counter_text_normal(
                              widget.taskList.allDoneInList.toString(),
                              widget.taskList.sizeListOfTasks.toString(),
                              10,
                              selCol),
                        ),
                      ),
                      widget.taskList.sizeListOfTasks > 0
                          ? Circle_Counter(
                              widget.taskList.allDoneInList /
                                  widget.taskList.sizeListOfTasks,
                              40,
                              10.0,
                              selCol)
                          : Circle_Counter(0, 40, 10.0, selCol),
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
  taskListStyle();
  @override
  State<taskListStyle> createState() => _taskListStyleState();
}


class _taskListStyleState extends State<taskListStyle>
    with SingleTickerProviderStateMixin {
  var listKey = GlobalKey<AnimatedListState>();
  List<Task> _tasks = [];
  final contadorStream = new StreamController<int>();



  @override
  void initState() {
    super.initState();
    cargarInstantTasks();
    setState(() {});
  }

  cargarInstantTasks() async {
    _tasks = await Instant_Firebase().getAllTasks();
    setState(() {
      listKey = GlobalKey<AnimatedListState>();
    });
  }


  @override
  void dispose() {
    contadorStream.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    contador = _tasks.where((element) => element.getState == false).length;
    contadorStream.sink.add(contador);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      StreamBuilder(
          stream: contadorStream.stream,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(children: [
                Expanded(child: Title18("Simple tasks")),
                IconButton(
                    onPressed: () => delete_all_done(),
                    icon: Icon(
                      Icons.delete_outline_outlined,
                      color: my_Colors.red,
                      size: 18,
                    )),
                SizedBox(
                  width: 10,
                ),
                counter_text_normal(
                  snapshot.data.toString(),
                  _tasks.length.toString(),
                  12,
                  my_Colors.green,
                ),
              ]),
            );
          }),
      Expanded(
        child: Stack(
          children: [

            AnimatedList(
              key: listKey,
              padding: EdgeInsets.only(
                  left: 2, bottom: kFloatingActionButtonMargin + 60),
              initialItemCount: _tasks.length,
              itemBuilder: (context, index, animation) {
              
                return taskStyle(this.context, _tasks[index], index,
                    contadorStream, animation);
              },
            ),

            if(_tasks.length == 0)...[Center(child: NoInstantTasks(),)],
            
            
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

  // Give a task for being create
  SizeTransition taskStyle(BuildContext context, Task task, int index,
      StreamController contadorStream, Animation<double> animation) {

    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
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
                      Instant_Firebase().Update(task);
                      if (contador == _tasks.length && contador != 0) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: celebration(),
                          duration: const Duration(seconds: 3),
                        ));
                      }

                      // Check as UNDONe
                    } else {
                      contador--;
                      task.state = true;
                      undown_and_up(index);
                      Instant_Firebase().Update(task);
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
                          builder: (context) =>
                              Write_Task(task: task.getTaskTopic!)));

                  if (new_task_topic != "") {
                    task.setTaskTopic = new_task_topic;
                    Instant_Firebase().Update(task);

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


  _go_to_writeTask() async {
    String task_name = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Write_Task(task: "")));

    if (task_name != "") {
      Task newTask = Task(taskTopic: task_name, state: true);
      insert_task(newTask);
      try {
        newTask.setId =
            Instant_Firebase().Insert(Task(taskTopic: task_name, state: true));
      } on Exception catch (e) {
        newTask.setId = '1234Error';
        print("Something went wrong");
      }

      setState(() {});
    }
  }

  void insert_task(Task taskk) {
    _tasks.insert(0, taskk);
    listKey.currentState!.insertItem(0, duration: Duration(milliseconds: 500));
  }

  void done_and_down(int i) {
    Task taskk = _tasks[i];
    _tasks.removeAt(i);
    listKey.currentState!.removeItem(
        i,
        (context, animation) =>
            taskStyle(context, taskk, i, contadorStream, animation),
        duration: Duration(milliseconds: 500));

    final newIndex = _tasks.length;
    _tasks.insert(newIndex, taskk);
    listKey.currentState!
        .insertItem(newIndex, duration: Duration(milliseconds: 500));
  }

  void delete_all_done() {
    for (int i = 0; i < _tasks.length; i++) {
      setState(() {
        if (_tasks[i].getState == false) {
          Task taskk = _tasks[i];
          _tasks.removeAt(i);

          if (taskk.getId != null) {
            Instant_Firebase().Delete(taskk.getId.toString());
          }

          listKey.currentState!.removeItem(
            i,
            (context, animation) =>
                taskStyle(context, taskk, i, contadorStream, animation),
          );

          i--;
        }
      });
    }

    listKey = GlobalKey<AnimatedListState>();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("All done tasks have been removed"),
      duration: const Duration(seconds: 3),
    ));

  }

  void undown_and_up(int i) {
    Task taskk = _tasks[i];
    _tasks.removeAt(i);
    listKey.currentState!.removeItem(
        i,
        (context, animation) =>
            taskStyle(context, taskk, i, contadorStream, animation),
        duration: Duration(milliseconds: 500));

    _tasks.insert(0, taskk);
    listKey.currentState!.insertItem(0, duration: Duration(milliseconds: 500));
  }


}
