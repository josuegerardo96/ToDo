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
  final List<taskModel> _tasks;
  taskListStyle(this._tasks);

  @override
  State<taskListStyle> createState() => _taskListStyleState();
}





class _taskListStyleState extends State<taskListStyle> {

  final contadorStream = new StreamController<int>();
  



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
                "Tasks",
                snapshot.data.toString() +
                    " / " +
                    widget._tasks.length.toString());
          }),



      SizedBox(height: 15.0),



      Expanded(
        child: ListView.builder(
          itemCount: widget._tasks.length,
          itemBuilder: (context, index) {
            taskModel task = widget._tasks[index];
            
            return taskStyle(task, index, contadorStream);
          },
        ),
      ),
    ]);
  }
}

// Give a task for being create
class taskStyle extends StatefulWidget {
  final taskModel _task;
  final int index;
  final StreamController<int> contadorStream;
  taskStyle(this._task, this.index, this.contadorStream);

  @override
  State<taskStyle> createState() => _taskStyleState();
}




// Draw every task in a stateful element
class _taskStyleState extends State<taskStyle> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, top: 10.0),
        child: Row(
          children: <Widget>[
            // Button for check the state of the task
            new GestureDetector(
              onTap: () {
                setState(() {
                  // Changes the state of the task

                  if (widget._task.state == true) {
                    contador++;
                    widget._task.state = false;
                  } else {
                    contador--;
                    widget._task.state = true;
                  }
                });

                widget.contadorStream.sink.add(contador);

                // IMPROVE crear función correcta de cómo se tiene que comportar el cambio de estado de esta vara
                //db_Instant_Task().updateState_MyInstantTasks(widget.index);
              },
              child: widget._task.state
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
                  widget._task.setState = true;
                  Navigator.of(context)
                      .pushNamed('/write_task', arguments: widget._task);
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
                        widget._task.taskTopic,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                            fontSize: 14.0,
                            color: Color(0xff202B57),
                            textStyle: widget._task.state
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
}
