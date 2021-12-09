// ignore_for_file: camel_case_types
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/Objects/task_circle.dart';
import 'package:my_to_do/helpers/my_style.dart';

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
  



  @override
  Widget build(BuildContext context) {
    contador = widget._tasks.where((element) => element.getState == false).length;
    contadorStream.sink.add(contador);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, children: [



      SizedBox(height: 10.0,),


      Row(
        children: [ 

          Expanded(
            flex: 1,
            child: new GestureDetector(
              onTap: (){Navigator.of(context).pushNamed('/list_lists');},
              child: Icon(Icons.arrow_back_ios_new_sharp, color: my_Colors.text_color_main, size:18),
            ),
          ),





          Expanded(
            flex:6,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.list_name,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(
                  color: my_Colors.text_color_main,
                  fontSize: 18.0,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                )  
              ),
            ),
          ),
        
        
          Expanded(
            flex: 3,
            child: StreamBuilder(
              stream: contadorStream.stream,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          
                if(!snapshot.hasData){
                  return Column(
                    children: [

                      circle_percent(0,60, 12),
                      SizedBox(height: 5.0), 
                      Text(
                        "Nothing",
                        style: TextStyle(
                            fontSize: 14.0, 
                            color: my_Colors.tex_color_grey
                          )
                        )
                    ]
                  );
          
          
          
                }else{


                  return Column(
                    children: [
                      SizedBox(height: 15.0,),
                      circle_percent(snapshot.data!/widget._tasks.length,60, 12),
                      SizedBox(height: 10.0), 
                      Text(
                        snapshot.data.toString()+" / "+widget._tasks.length.toString(),
                        style: TextStyle(
                            fontSize: 10.0, 
                            color: my_Colors.tex_color_grey
                          )
                        )
                    ]
                  );
                }
                
                
                
                
              }
            ),
          ),

        ]
      ),



      SizedBox(height: 15.0),


      
      // It's where the tasks are created
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
