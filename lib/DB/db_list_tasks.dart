
import 'package:my_to_do/Objects/task.dart';
import 'package:my_to_do/Objects/taskList.dart';

class db_list_tasks{

  db_list_tasks();
  List<TaskList> ListOfTasks = [];


  List<TaskList> start_myListOfTasks(){

    ListOfTasks.add(TaskList(
      nameList: "Batman es un heroe muy amado por todosss", 
      ListOfTasks: <Task>[ Task(taskTopic: "batsi", state: false),
                                Task(taskTopic: "Batman 2", state: false),
                                Task(taskTopic: "Batman 3 es cuando Batman lucha contra Bane", state: false),
                                Task(taskTopic: "Batman 4", state: false),
                                Task(taskTopic: "Batman 5", state: false),
                                Task(taskTopic: "Batman 6", state: false),
                                Task(taskTopic: "Batman 7", state: false),
                                Task(taskTopic: "Batman 8", state: false),
                                Task(taskTopic: "Batman 9", state: false),
                                Task(taskTopic: "Batman 10", state: false),
                                Task(taskTopic: "Batman 11", state: false),
                                Task(taskTopic: "Batman 12", state: false),
                                Task(taskTopic: "Batman 13", state: false),
                                Task(taskTopic: "Batman 14", state: false),
                                Task(taskTopic: "Batman 15 es una pelicula rara", state: false)] 
      )
    );


    ListOfTasks.add(TaskList(
      nameList: "Superman", 
      ListOfTasks: <Task>[ Task(taskTopic: "Sups", state: true),
                                Task(taskTopic: "Superman 2", state: true),
                                Task(taskTopic: "Superman 3 es cuando Superman es Henry Cavill", state: true),
                                Task(taskTopic: "Superman 4", state: true),
                                Task(taskTopic: "Superman 5", state: true),
                                Task(taskTopic: "Superman 6", state: false),
                                Task(taskTopic: "Superman 7", state: false),
                                Task(taskTopic: "Superman 8", state: false),
                                Task(taskTopic: "Superman 9", state: true),
                                Task(taskTopic: "Superman 10", state: true),
                                Task(taskTopic: "Superman 11", state: true),
                                Task(taskTopic: "Superman 12", state: true),
                                Task(taskTopic: "Superman 13", state: true),
                                Task(taskTopic: "Superman 14", state: true),
                                Task(taskTopic: "Superman 15 es una pelicula rara", state: true)] 
      )
    );


    ListOfTasks.add(TaskList(
      nameList: "Iron Man", 
      ListOfTasks: <Task>[ Task(taskTopic: "Tony", state: true),
                                Task(taskTopic: "Iron Man 2", state: true),
                                Task(taskTopic: "Iron Man 3 es cuando Iron Man lucha contra Bane", state: true),
                                Task(taskTopic: "Iron Man 4", state: true),
                                Task(taskTopic: "Iron Man 5", state: true),
                                Task(taskTopic: "Iron Man 6", state: false),
                                Task(taskTopic: "Iron Man 7", state: false),
                                Task(taskTopic: "Iron Man 8", state: false),
                                Task(taskTopic: "Iron Man 9", state: true),
                                Task(taskTopic: "Iron Man 10", state: true),
                                Task(taskTopic: "Iron Man 11", state: true),
                                Task(taskTopic: "Iron Man 12", state: true),
                                Task(taskTopic: "Iron Man 13", state: true),
                                Task(taskTopic: "Iron Man 14", state: true),
                                Task(taskTopic: "Iron Man 15 es una pelicula rara", state: true)] 
      )
    );


    ListOfTasks.add(TaskList(
      nameList: "Naruto", 
      ListOfTasks: <Task>[ Task(taskTopic: "Naruto Shippuden", state: true),
                                Task(taskTopic: "Naruto 2", state: true),
                                Task(taskTopic: "Naruto 3 es cuando Naruto lucha contra Bane", state: true),
                                Task(taskTopic: "Naruto 4", state: true),
                                Task(taskTopic: "Naruto 5", state: true),
                                Task(taskTopic: "Naruto 6", state: false),
                                Task(taskTopic: "Naruto 7", state: false),
                                Task(taskTopic: "Naruto 8", state: false),
                                Task(taskTopic: "Naruto 9", state: true),
                                Task(taskTopic: "Naruto 10", state: true),
                                Task(taskTopic: "Naruto 11", state: true),
                                Task(taskTopic: "Naruto 12", state: true),
                                Task(taskTopic: "Naruto 13", state: true),
                                Task(taskTopic: "Naruto 14", state: true),
                                Task(taskTopic: "Naruto 15 es una pelicula rara", state: true)]
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