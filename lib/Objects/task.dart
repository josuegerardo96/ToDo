// ignore_for_file: camel_case_types


// FALSE means "done" 'cause it means that is a task anymore
// TRUE means "still a task"

class Task {

  String? taskTopic;
  bool? state;
  String? id;

  Task({required this.taskTopic,required this.state, this.id});

  Task.fromJSON({required Map json}){
    this.taskTopic = json['task'];
    this.state = json['state'];
    this.id = json['ID'];
  }



  String? get getTaskTopic => this.taskTopic;
  set setTaskTopic(String taskTopic) => this.taskTopic = taskTopic;

  bool? get getState => this.state;
  set setState( state) => this.state = state;

  String? get getId => this.id;
  set setId(String? id) => this.id = id;
 

  

}
