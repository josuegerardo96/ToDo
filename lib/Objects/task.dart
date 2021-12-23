// ignore_for_file: camel_case_types


// FALSE means "done" 'cause it means that is a task anymore
// TRUE means "still a task"

class Task {

  String taskTopic;
  bool state;
 
  Task({required this.taskTopic,required this.state});


  String get getTaskTopic => this.taskTopic;
  set setTaskTopic(String taskTopic) => this.taskTopic = taskTopic;

  bool get getState => this.state;
  set setState( state) => this.state = state;

}
