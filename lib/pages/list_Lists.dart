// ignore_for_file: camel_case_types

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:my_to_do/ListStyle/list_of_lists.dart';
import 'package:my_to_do/Objects/taskList.dart';
import 'package:my_to_do/helpers/my_style.dart';
import '../visual/main_visual.dart';
import 'package:my_to_do/DB/db_list_tasks.dart';



class list_of_Lists extends StatefulWidget {


  @override
  State<list_of_Lists> createState() => _list_of_ListsState();
}

class _list_of_ListsState extends State<list_of_Lists> {
  List<taskListModel> myLists = [];


  @override
  void initState() {
    super.initState();
    myLists = db_list_tasks().start_myListOfTasks();
  }


  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
        body: SafeArea(
          child: Container(
            
            color: my_Colors.background_color_white,

            child: Column(

              children: <Widget>[

                new GestureDetector(  
                  onTap:(){
                    Navigator.popAndPushNamed(context, "/");
                  },

                  child: title()


                  
                ),

                line_text("Lists", myLists.length.toString()+" lists"),

                SizedBox(height: 20.0),

                Expanded(
                  child: myLists.length > 0 ? 
                        create_list_of_lists(myLists) : 
                        no_list_in_lists()),

              ],



            ),







          )
        ),



        floatingActionButton: FabCircularMenu(
          fabOpenIcon: Icon(Icons.add, color: my_Colors.background_color_white),
          fabCloseIcon:
              Icon(Icons.close, color: my_Colors.background_color_white),
          ringColor: Colors.transparent,
          fabMargin: EdgeInsets.all(20.0),
          ringWidth: MediaQuery.of(context).size.width * 0.9,
          children: <Widget>[
            
            
            
            IconButton(
                onPressed: (){
                  Navigator.popAndPushNamed(
                    context, 
                    "/write_list", 
                    arguments: taskListModel(
                      nameList: "", ListOfTasks: []));},
                      
                icon: Icon(Icons.add, color: my_Colors.text_color_main,)),


            IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("All list completed removed"),
                    duration: const Duration(seconds: 3),
                  ));

                  setState(() {
                    myLists.removeWhere((e) => e.allDoneInList == 0);
                  });
                },
                icon: Icon(Icons.delete, color: my_Colors.text_color_main)),

            
          ],
        ),
      );






  }
}