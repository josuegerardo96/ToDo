// ignore_for_file: camel_case_types


// FALSE means "done" 'cause it means that is a task anymore
// TRUE means "still a task"

class taskModel {

  String taskTopic;
  bool state;



  taskModel({required this.taskTopic,required this.state});



  String get getTaskTopic => this.taskTopic;
  set setTaskTopic(String taskTopic) => this.taskTopic = taskTopic;

  get getState => this.state;
  set setState( state) => this.state = state;

}
