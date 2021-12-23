import 'package:my_to_do/Objects/task.dart';



// Save a new list 

class TaskList{

  String nameList;
  List<Task> ListOfTasks;



  TaskList({required this.nameList, required this.ListOfTasks});



  get getNameList => this.nameList;
  set setNameList(String nameList) => this.nameList = nameList;

  get getListOfTasks => this.ListOfTasks;
  set setListOfTasks( ListOfTasks) => this.ListOfTasks = ListOfTasks;

  get sizeListOfTasks => this.ListOfTasks.length;

  get allDoneInList => this.ListOfTasks.where((e) => e.getState==false).length;


}