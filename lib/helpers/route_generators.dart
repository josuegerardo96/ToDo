import 'package:flutter/material.dart';
import 'package:my_to_do/pages/list_Lists.dart';
import 'package:my_to_do/main.dart';
import 'package:my_to_do/pages/write_task.dart';



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
        return MaterialPageRoute(builder: (_)=>  Write_Task());     

        
         

      // ToDo Crear página para errores
      default:
        return MaterialPageRoute(builder: (_) => main_screen());
      







    }
  }
}