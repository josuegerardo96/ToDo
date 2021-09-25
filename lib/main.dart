// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_to_do/ListStyle/taskStyle.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:my_to_do/helpers/my_style.dart';
import 'package:my_to_do/helpers/route_generators.dart';
import 'visual/main_visual.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,

    // main route of the app
    initialRoute: '/',
    // In the file "route_generates" are all the routes used in the app
    onGenerateRoute: RouteGenerator.generateRoute,

  ));
}



// Starts the code for the main screen
class main_screen extends StatefulWidget {
  @override
  _main_screenState createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  
  @override
  Widget build(BuildContext context) {

    // Change statusBar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: my_Colors.main_color
      )
    );


    return Scaffold(


      //start the screen
      body: SafeArea(

        child: Container(
          
          color: my_Colors.background_color_white,
          
          child: Column(
            
            // The full column will take all the space in the screen
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            
            children: <Widget>[
              
              title(),
              line_text("Lists", "0 lists"),

              
              // LIST OF LISTS
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Row(

                  children: <Widget>[

                    // When there are lists

                    

                    // When they are NOT lists
                    no_lists()


                  ],
                ),
              ),

  
              line_text("Instant tasks", "0 tasks"),

              
              // INSTANT TASKS

              // When the list has something shows this
              Expanded(child: taskListStyle(_returnListofInstantTasks()))


              // If the list has nothing shows this
              //no_instant_tasks(),


            ],
          ),
        ),
      ),




      floatingActionButton: FabCircularMenu(

        fabOpenIcon: Icon(Icons.add, color: my_Colors.background_color_white),
        fabCloseIcon:Icon(Icons.close, color: my_Colors.background_color_white),
        ringColor: Colors.transparent,
        fabMargin: EdgeInsets.all(20.0),
        ringWidth: MediaQuery. of(context).size.width * 0.9,
        

        children: <Widget>[

          IconButton(onPressed: ()=>{_goTo_write_tasks()}, icon: Icon(Icons.edit, color: my_Colors.text_color_main,)),

          // ToDo Eliminar todos los elementos con estado false
          IconButton(onPressed: ()=>{_delete_all_done()}, icon: Icon(Icons.delete, color: my_Colors.text_color_main)),

          // ToDo Pantalla para crear listas
          IconButton(onPressed: ()=>{_goTo_list_of_lists(context)}, icon: Icon(Icons.list, color: my_Colors.text_color_main)),

        ],
      ),
    




    );
  }

  


  void _goTo_list_of_lists(BuildContext context) {
    Navigator.popAndPushNamed(context, "/list_lists");
  }

  void _goTo_write_tasks(){
    Navigator.of(context).pushNamed('/write_task');
  }

  void _delete_all_done(){
    print("Borrando la hostia");
  }



  _returnListofInstantTasks(){



    return <taskModel>[


      taskModel(taskTopic: "Spiderman 1", state: true),
      taskModel(taskTopic: "Spiderman 2", state: true),
      taskModel(taskTopic: "Spiderman 3 es la peor pelicula de la saga de sam raimi pero igual la disfrute mucho", state: true),
      taskModel(taskTopic: "Spiderman 4", state: true),
      taskModel(taskTopic: "Spiderman 5", state: true),
      taskModel(taskTopic: "Spiderman 6", state: false),
      taskModel(taskTopic: "Spiderman 7", state: false),
      taskModel(taskTopic: "Spiderman 8", state: false),
      taskModel(taskTopic: "Spiderman 9", state: true),
      taskModel(taskTopic: "Spiderman 10", state: true),
      taskModel(taskTopic: "Spiderman 11", state: true),
      taskModel(taskTopic: "Spiderman 12", state: true),
      taskModel(taskTopic: "Spiderman 13", state: true),
      taskModel(taskTopic: "Spiderman 14", state: true),
      taskModel(taskTopic: "Spiderman 15 es una pelicula rara", state: true),


    ];
    
    // ToDo Crear simulador de base de datos

    // ToDo Obtener los elementos de una base de datos

    // ToDo Una vez obtenidos los elementos de la base de datos se debe de ordenar donde los false van en la parte baja



  }

  // ToDo Crear ventanas para escritura de -> Lista , Solo ver y editar elemento




}


