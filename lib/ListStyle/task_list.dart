// ignore_for_file: camel_case_types
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/helpers/my_style.dart';
import 'package:my_to_do/visual/main_visual.dart';

// This file returns the instant task style
int contador = 0;


// This class return a FULL ListView of the instant tasks to the main screen
class taskListStyle extends StatefulWidget {
  List<taskModel> _tasks;
  taskListStyle(this._tasks);
  @override
  State<taskListStyle> createState() => _taskListStyleState();
}



// This class create the bar with text and the list
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
                      taskModel task, 
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



  void done_and_down(int i){
    taskModel taskk = widget._tasks[i];
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
    taskModel taskk = widget._tasks[i];
    widget._tasks.removeAt(i);
    listKey.currentState!.removeItem(
      i, (context, animation) => 
      taskStyle(context, taskk, i, contadorStream, animation),
      duration: Duration(milliseconds: 500));

    widget._tasks.insert(0, taskk);
    listKey.currentState!.insertItem(0, duration: Duration(milliseconds: 500));

  }




}




