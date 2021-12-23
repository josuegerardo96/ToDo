// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable
import 'dart:async';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/DB/db_instant_task.dart';
import 'package:my_to_do/DB/db_list_tasks.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:my_to_do/Objects/taskList.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';
import 'package:my_to_do/helpers/Colors/randomColors.dart';
import 'package:my_to_do/helpers/Texts/title.dart';
import 'package:my_to_do/helpers/route_generators.dart';
import 'package:my_to_do/helpers/task_circle.dart';
import 'helpers/titles.dart';
import 'helpers/empty_spaces.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',  // main route of the app
    onGenerateRoute: RouteGenerator.generateRoute, // In the file "route_generates" are all the routes used in the app
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
          
          child: Column(
            // The full column will take all the space in the screen
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10, vertical: 30),
                child: Row(
                  children: [
                    Expanded(child: Main_title()),
                    IconButton(
                      onPressed: (){}, 
                      icon: Icon(Icons.more_vert, color: my_Colors.black,)
                    ),
                  ]
                ),
              ),



              // LIST OF LISTS
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
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


              // INSTANT TASKS
              Expanded(
                  child: MyinstantTasksList.length > 0
                      ? taskListStyle(MyinstantTasksList)
                      : NoInstantTasks())
            ],
          ),
        ),
      ),

      // Float button for some options
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
                  {
                    Navigator.of(context).pushNamed('/write_task',
                        arguments: Task(taskTopic: "", state: false)).then((value){setState(() {
                          // ToDo actualizar la base de datos
                        });})
                  },
              icon: Icon(
                Icons.edit,
                color: my_Colors.text_color_main,
              )),
          IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("All done tasks have been removed"),
                  duration: const Duration(seconds: 3),
                ));

                setState(() {
                  MyinstantTasksList.removeWhere((t) => t.getState == false);
                });
              },
              icon: Icon(Icons.delete, color: my_Colors.text_color_main)),
          IconButton(
              onPressed: () =>
                  {Navigator.pushNamed(context, "/list_lists")},
              icon: Icon(Icons.list, color: my_Colors.text_color_main)),
        ],
      ),
    );
  }
}




//--------------------------------------
//VISUAL
//--------------------------------------

// INSTANT TASK LIST CLASS
int contador = 0;
// This class return a FULL ListView of the instant tasks to the main screen
class taskListStyle extends StatefulWidget {
  List<Task> _tasks;
  taskListStyle(this._tasks);
  @override
  State<taskListStyle> createState() => _taskListStyleState();
}

class _taskListStyleState extends State<taskListStyle> with SingleTickerProviderStateMixin{
  final contadorStream = new StreamController<int>();
  final listKey = GlobalKey<AnimatedListState>();


  @override
  void dispose() {
    contadorStream.close();
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    contador = widget._tasks.where((element) => element.getState == false).length;
    contadorStream.sink.add(contador);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      StreamBuilder(
        stream: contadorStream.stream,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return line_text(
              "Instant tasks",
              snapshot.data.toString() +
                  " / " +
                  widget._tasks.length.toString());
        }
      ),
      SizedBox(height: 15.0),
      Expanded(
        child: AnimatedList(
          key: listKey,
          initialItemCount: widget._tasks.length,
          itemBuilder: (context, index, animation) {
            return taskStyle(this.context, widget._tasks[index], index, contadorStream, animation);
          },
        ),
      ),
    ]);
  }

  // Give a task for being create
  SizeTransition taskStyle(BuildContext context, 
                      Task task, 
                      int index, 
                      StreamController contadorStream, Animation<double> animation ){

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
                        .pushNamed('/write_task', arguments: task).then((value){setState(() {
                          //ToDo actualizar la base de datos


                        });});
                  },
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
              )
            ],
          ),
        ),
      );
    
  }



  void done_and_down(int i){
    Task taskk = widget._tasks[i];
    widget._tasks.removeAt(i);
    listKey.currentState!.removeItem(
      i, (context, animation) => 
      taskStyle(context, taskk, i, contadorStream, animation),
      duration: Duration(milliseconds: 500));
    
    final newIndex = widget._tasks.length;
    widget._tasks.insert(newIndex, taskk);
    listKey.currentState!.insertItem(newIndex, duration: Duration(milliseconds: 500));

  }

  void undown_and_up(int i){
    Task taskk = widget._tasks[i];
    widget._tasks.removeAt(i);
    listKey.currentState!.removeItem(
      i, (context, animation) => 
      taskStyle(context, taskk, i, contadorStream, animation),
      duration: Duration(milliseconds: 500));

    widget._tasks.insert(0, taskk);
    listKey.currentState!.insertItem(0, duration: Duration(milliseconds: 500));

  }



}



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
        itemBuilder: (context, index){
          TaskList taskList = ListOfLists[index];
          return everyTaskListInMain(taskList, index, ListOfLists[index].sizeListOfTasks);
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


  
  @override
  Widget build(BuildContext context) {

    Color selCol = R_Colors().listOfRColors()[widget.index % 10];
    
    return GestureDetector(

      onTap: (){
        Navigator.of(context).pushNamed("/tasks_in_list", arguments: widget.taskList).then((value){setState(() {
          // ToDo actualizar la lista con los cambios realizados
        });});
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
            )
          ),


          
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

                Spacer(flex: 1,),

                // Row of counter and Circle
                Padding(
                  padding: const EdgeInsets.only(left:15.0, right: 5),
                  
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: counter_text(
                            widget.contador.toString(), 
                            widget.taskList.sizeListOfTasks.toString(), 
                            10, 
                            selCol),
                        ),
                      ),
                      Circle_Counter(widget.taskList.allDoneInList/widget.taskList.sizeListOfTasks, 40, 10.0, selCol),
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
