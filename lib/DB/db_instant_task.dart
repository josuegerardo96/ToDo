


// ignore_for_file: non_constant_identifier_names

import 'package:my_to_do/Objects/task.dart';

class db_Instant_Task {


  db_Instant_Task();
  List<Task> _myInstantTasks = [];






  List<Task> read_MyInstantTasks(){

    _myInstantTasks.add(Task(taskTopic: "Spidey", state: true));
    _myInstantTasks.add(Task(taskTopic: "Spiderman 2", state: true));
    _myInstantTasks.add(Task(taskTopic: "Spiderman 3 es la peor pelicula de la saga de sam raimi pero igual la disfrute mucho", state: true));
    _myInstantTasks.add(Task(taskTopic: "Spiderman 4", state: true));
    _myInstantTasks.add(Task(taskTopic: "Spiderman 5", state: true));
    _myInstantTasks.add(Task(taskTopic: "Spiderman 6", state: false));
    _myInstantTasks.add(Task(taskTopic: "Spiderman 7", state: false));
    _myInstantTasks.add(Task(taskTopic: "Spiderman 8", state: false));
    _myInstantTasks.add(Task(taskTopic: "Spiderman 9", state: true));
    _myInstantTasks.add(Task(taskTopic: "Spiderman 10", state: true));
    _myInstantTasks.add(Task(taskTopic: "Spiderman 11", state: true));
    _myInstantTasks.add(Task(taskTopic: "Spiderman 12", state: true));
    _myInstantTasks.add(Task(taskTopic: "Spiderman 13", state: true));
    _myInstantTasks.add(Task(taskTopic: "Spiderman 14", state: true));
    _myInstantTasks.add(Task(taskTopic: "Spiderman 15 es una pelicula rara", state: true));


    _myInstantTasks.sort((a,b){
      if(a.getState == true){
        return -1;
      }else{
        return 1;
      }
     }
    );

    return _myInstantTasks;

  }


  void updateState_MyInstantTasks(int id){
    _myInstantTasks[id].state = !_myInstantTasks[id].state;
  }

  void updateTaskTopic_MyInstantTask(String str, int id){
    _myInstantTasks[id].taskTopic = str;
  }



  void insert_MyInstantTasks(Task task){
    _myInstantTasks.add(task);
  }


  void delete_MyInstantTasks(int id){
    _myInstantTasks.removeAt(id);
  }




  
}