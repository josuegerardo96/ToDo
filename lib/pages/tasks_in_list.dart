import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/ListStyle/task_list.dart';
import 'package:my_to_do/ListStyle/task_list_in_list.dart';
import 'package:my_to_do/Objects/taskList.dart';
import 'package:my_to_do/Objects/task_circle.dart';
import 'package:my_to_do/helpers/my_style.dart';
import 'package:my_to_do/visual/main_visual.dart';



class tasksInOneList extends StatefulWidget {

  taskListModel oneTaskList;
  tasksInOneList(this.oneTaskList);
  

  @override
  _tasksInOneListState createState() => _tasksInOneListState();
}






class _tasksInOneListState extends State<tasksInOneList> {
  @override
  Widget build(BuildContext context) {

  


    return Scaffold(

      body: SafeArea(
        child: Container(


          child: Column(
            children: [





              Expanded(            
                child: 
                  widget.oneTaskList.sizeListOfTasks > 0 ?
                        taskListStyleInList(widget.oneTaskList.getListOfTasks,widget.oneTaskList.nameList) : no_instant_tasks()
              )









            ],
          ),
      
          
      
      
      
      
        ),
      ),



    );
  }
}