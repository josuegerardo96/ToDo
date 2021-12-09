
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:my_to_do/Objects/taskList.dart';
import 'package:my_to_do/Objects/task_circle.dart';
import 'package:my_to_do/helpers/my_style.dart';
import 'package:google_fonts/google_fonts.dart';


class ListOfListsStyle extends StatelessWidget {
  
   final List<taskListModel> ListOfLists;
   ListOfListsStyle(this.ListOfLists);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.0,
      child: ListView.builder(
        itemCount: ListOfLists.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index){
          taskListModel taskList = ListOfLists[index];
          return taskListStyl(taskList, index, ListOfLists[index].sizeListOfTasks);
        },
    
    
      ),
    );
  }
}




class taskListStyl extends StatefulWidget {
  final taskListModel taskList;
  int index;
  int contador;
  taskListStyl(this.taskList, this.index, this.contador);

  @override
  _taskListStyleState createState() => _taskListStyleState();
}

class _taskListStyleState extends State<taskListStyl> {


  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: 160.0,


      child: Card(

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        color: my_Colors.background_color_task,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(

            children: <Widget>[

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.taskList.getNameList,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.roboto(
                          fontSize: 16.0,
                          color: Color(0xff202B57),
                          textStyle: TextStyle(fontWeight: FontWeight.bold),
                          
                  ),
                  
                ),
              ),

              SizedBox(height: 10.0),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.contador.toString(),
                  style: GoogleFonts.roboto(
                    fontSize: 12.0,
                    color: my_Colors.tex_color_grey,
                  ),
                ),
              ),

              SizedBox(height: 8,),



              Align(
                alignment: Alignment.bottomRight,
                child: circle_percent(widget.taskList.allDoneInList/widget.taskList.sizeListOfTasks, 30, 9.0),
              )



            ],



          ),



        ),
        
      ),
    );
  }
}