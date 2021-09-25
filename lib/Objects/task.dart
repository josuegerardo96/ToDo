class taskModel {


String taskTopic;
bool state;



taskModel({required this.taskTopic,required this.state});





String get getTaskTopic => this.taskTopic;
set setTaskTopic(String taskTopic) => this.taskTopic = taskTopic;

get getState => this.state;
set setState( state) => this.state = state;







  

}
