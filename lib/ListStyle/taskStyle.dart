// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/helpers/my_style.dart';




class taskListStyle extends StatelessWidget {

  final List<taskModel> _tasks;
  taskListStyle(this._tasks);
  

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: _buildTaskList(),
    );
  }
  List<taskStyle> _buildTaskList(){
    return _tasks.map((taski) => new taskStyle(taski)).toList();
  }
}







class taskStyle extends StatefulWidget {


  final taskModel _task;
  taskStyle(this._task);

  @override
  State<taskStyle> createState() => _taskStyleState();
}

class _taskStyleState extends State<taskStyle> {
  @override
  Widget build(BuildContext context) {

    return new Container (
      
      
      
      


      child: Padding(
        padding: EdgeInsets.only(left: 10.0, top:10.0),
        child: Row(
          
      
          
          children: <Widget>[
      
      
            new GestureDetector(

              onTap:(){
                
                setState(() {
                  widget._task.state ? widget._task.state = false : widget._task.state = true;
                });
                
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
                  print("kkkkk");
                },
            
            
                child: Expanded(
                  
                
                  child: Container(
                    
                    decoration: new BoxDecoration(
                      color: my_Colors.background_color_task,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0), topLeft: Radius.circular(10.0))
                    ),
                    
                    
                    // Esto es solo del texto dentro de la vara
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