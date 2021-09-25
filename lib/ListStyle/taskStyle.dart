// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/helpers/my_style.dart';



// This file returns the instant task style



// This class return a FULL ListView of the instant tasks to the main screen
class taskListStyle extends StatelessWidget {

  final List<taskModel> _tasks;
  taskListStyle(this._tasks);
  

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: _buildTaskList(),
    );
  }

  // Map all the tasks
  List<taskStyle> _buildTaskList(){
    return _tasks.map((taski) => new taskStyle(taski)).toList();
  }
}


// Give a task for being create
class taskStyle extends StatefulWidget {
  final taskModel _task;
  taskStyle(this._task);

  @override
  State<taskStyle> createState() => _taskStyleState();
}


// Draw every task in a stateful element
class _taskStyleState extends State<taskStyle> {
  @override
  Widget build(BuildContext context) {

    return new Container (

      child: Padding(
        padding: EdgeInsets.only(left: 10.0, top:10.0),
        child: Row(
         
          children: <Widget>[
      
            // Button for check the state of the task
            new GestureDetector(

              onTap:(){
                setState(() {

                  // Changes the state of the task
                  widget._task.state ? 
                    widget._task.state = false 
                    : 
                    widget._task.state = true;
                });

                // ToDo Crear aquí función para cambiar en la base de datos el estado de este task
                
              },


              child: widget._task.state ? 
                  Image(
                    image: AssetImage('assets/circle.png'),
                    height: 25,
                    width: 25,
                  ) 
                  : 
                  Image(
                    image: AssetImage('assets/circle-check.png'),
                    height: 25,
                    width: 25,
                  ),
            ),
      
        
            SizedBox(width: 10.0,),
      
      
            
      
      
            // El apartado del texto
            Expanded(
              child: new GestureDetector(
                
                
            
                onTap: (){

                  // ToDo enviar a donde leer el task completo
                  
                },
            
            
                child: Expanded(
                  child: Container(
                    
                    decoration: new BoxDecoration(
                      color: my_Colors.background_color_task,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), topLeft: Radius.circular(10.0))
                    ),
                    
                    
                    // TEXT
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      child: Text(
                        widget._task.taskTopic,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                              fontSize: 14.0,
                              color: Color(0xff202B57
                              ),
              
                              textStyle:
                                widget._task.state ?
                                    TextStyle(decoration: TextDecoration.none)
                                  :
                                    TextStyle(decoration: TextDecoration.lineThrough)
              
              
              
              
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            )
      
          ],
      
      
      
        ),
      ),

    ) ;
  }
}