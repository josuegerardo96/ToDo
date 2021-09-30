import 'package:flutter/material.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:my_to_do/Objects/taskList.dart';
import 'package:my_to_do/pages/list_Lists.dart';
import 'package:my_to_do/main.dart';
import 'package:my_to_do/pages/write_element.dart';
import 'package:my_to_do/pages/write_list.dart';



class RouteGenerator{

  static Route<dynamic> generateRoute(RouteSettings settings){

    final args = settings.arguments;



    switch(settings.name){

      // Main screen
      case '/':
        return MaterialPageRoute(builder: (_) => main_screen());
      

      // IMPROVE making this more interesting
      case '/list_lists':
        return MaterialPageRoute(builder: (_) => list_of_Lists());


      case '/write_task':
        return MaterialPageRoute(builder: (_) =>  Write_Task(task: args as taskModel));     
      
      case '/write_list':
        return MaterialPageRoute(builder: (_) => write_List(listOfTasks: args as taskListModel));

        
         

     
      default:
        return MaterialPageRoute(builder: (_) => main_screen());
      







    }
  }
}