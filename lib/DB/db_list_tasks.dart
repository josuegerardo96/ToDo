
import 'package:my_to_do/Objects/task.dart';
import 'package:my_to_do/Objects/taskList.dart';

class db_list_tasks{



  db_list_tasks();
  List<taskListModel> ListOfTasks = [];





  


  List<taskListModel> start_myListOfTasks(){

    ListOfTasks.add(taskListModel(
      nameList: "Batman es un super heroe que todo el mmundo admir por sus grandes destrezas", 
      ListOfTasks: <taskModel>[ taskModel(taskTopic: "batsi", state: false),
                                taskModel(taskTopic: "Batman 2", state: false),
                                taskModel(taskTopic: "Batman 3 es cuando Batman lucha contra Bane", state: false),
                                taskModel(taskTopic: "Batman 4", state: false),
                                taskModel(taskTopic: "Batman 5", state: false),
                                taskModel(taskTopic: "Batman 6", state: false),
                                taskModel(taskTopic: "Batman 7", state: false),
                                taskModel(taskTopic: "Batman 8", state: false),
                                taskModel(taskTopic: "Batman 9", state: false),
                                taskModel(taskTopic: "Batman 10", state: false),
                                taskModel(taskTopic: "Batman 11", state: false),
                                taskModel(taskTopic: "Batman 12", state: false),
                                taskModel(taskTopic: "Batman 13", state: false),
                                taskModel(taskTopic: "Batman 14", state: false),
                                taskModel(taskTopic: "Batman 15 es una pelicula rara", state: false)] 
      )
    );


    ListOfTasks.add(taskListModel(
      nameList: "Superman", 
      ListOfTasks: <taskModel>[ taskModel(taskTopic: "Sups", state: true),
                                taskModel(taskTopic: "Superman 2", state: true),
                                taskModel(taskTopic: "Superman 3 es cuando Superman es Henry Cavill", state: true),
                                taskModel(taskTopic: "Superman 4", state: true),
                                taskModel(taskTopic: "Superman 5", state: true),
                                taskModel(taskTopic: "Superman 6", state: false),
                                taskModel(taskTopic: "Superman 7", state: false),
                                taskModel(taskTopic: "Superman 8", state: false),
                                taskModel(taskTopic: "Superman 9", state: true),
                                taskModel(taskTopic: "Superman 10", state: true),
                                taskModel(taskTopic: "Superman 11", state: true),
                                taskModel(taskTopic: "Superman 12", state: true),
                                taskModel(taskTopic: "Superman 13", state: true),
                                taskModel(taskTopic: "Superman 14", state: true),
                                taskModel(taskTopic: "Superman 15 es una pelicula rara", state: true)] 
      )
    );


    ListOfTasks.add(taskListModel(
      nameList: "Iron Man", 
      ListOfTasks: <taskModel>[ taskModel(taskTopic: "Tony", state: true),
                                taskModel(taskTopic: "Iron Man 2", state: true),
                                taskModel(taskTopic: "Iron Man 3 es cuando Iron Man lucha contra Bane", state: true),
                                taskModel(taskTopic: "Iron Man 4", state: true),
                                taskModel(taskTopic: "Iron Man 5", state: true),
                                taskModel(taskTopic: "Iron Man 6", state: false),
                                taskModel(taskTopic: "Iron Man 7", state: false),
                                taskModel(taskTopic: "Iron Man 8", state: false),
                                taskModel(taskTopic: "Iron Man 9", state: true),
                                taskModel(taskTopic: "Iron Man 10", state: true),
                                taskModel(taskTopic: "Iron Man 11", state: true),
                                taskModel(taskTopic: "Iron Man 12", state: true),
                                taskModel(taskTopic: "Iron Man 13", state: true),
                                taskModel(taskTopic: "Iron Man 14", state: true),
                                taskModel(taskTopic: "Iron Man 15 es una pelicula rara", state: true)] 
      )
    );


    ListOfTasks.add(taskListModel(
      nameList: "Naruto", 
      ListOfTasks: <taskModel>[ taskModel(taskTopic: "Naruto Shippuden", state: true),
                                taskModel(taskTopic: "Naruto 2", state: true),
                                taskModel(taskTopic: "Naruto 3 es cuando Naruto lucha contra Bane", state: true),
                                taskModel(taskTopic: "Naruto 4", state: true),
                                taskModel(taskTopic: "Naruto 5", state: true),
                                taskModel(taskTopic: "Naruto 6", state: false),
                                taskModel(taskTopic: "Naruto 7", state: false),
                                taskModel(taskTopic: "Naruto 8", state: false),
                                taskModel(taskTopic: "Naruto 9", state: true),
                                taskModel(taskTopic: "Naruto 10", state: true),
                                taskModel(taskTopic: "Naruto 11", state: true),
                                taskModel(taskTopic: "Naruto 12", state: true),
                                taskModel(taskTopic: "Naruto 13", state: true),
                                taskModel(taskTopic: "Naruto 14", state: true),
                                taskModel(taskTopic: "Naruto 15 es una pelicula rara", state: true)]
      )
    );



    


    return ListOfTasks;
  }


  


  void updateName_myListOfTasks(){

  }

  void updateElement_myListOfTasks(){

  }


  void deleteElement_myListOfTasks(){

  }

  void deleteList_myListOfTasks(){

  }






}