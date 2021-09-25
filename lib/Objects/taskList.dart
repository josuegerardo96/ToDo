import 'package:my_to_do/Objects/task.dart';



// Save a new list 

class taskListModel{

  String nameList;
  List<taskModel> ListOfTasks;



  taskListModel({required this.nameList, required this.ListOfTasks});



 String get getNameList => this.nameList;

 set setNameList(String nameList) => this.nameList = nameList;

  get getListOfTasks => this.ListOfTasks;

 set setListOfTasks( ListOfTasks) => this.ListOfTasks = ListOfTasks;


  



}