
// ignore_for_file: camel_case_types, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:my_to_do/Objects/taskList.dart';


class Lists_firebase{

  final _user = FirebaseAuth.instance.currentUser;

  CreateList(String taskListName){
    final firebase = FirebaseFirestore.instance;
    var newDoc = firebase
        .collection(_user!.email.toString())
        .doc(taskListName);
    
    
    newDoc.set({
      'listName':taskListName,
    });
  }


  DeleteList(String taskListName){
    final firebase = FirebaseFirestore.instance;
    firebase
      .collection(_user!.email.toString())
      .doc(taskListName)
      .delete();
  }





  //-------------------------------------------
  // Tasks in list
  //-------------------------------------------


  String InsertTaskInList(String taskListName, Task task){
    final firebase = FirebaseFirestore.instance;
    var newDoc = firebase
                    .collection(_user!.email.toString())
                    .doc(taskListName)
                    .collection('Tasks')
                    .doc();
    newDoc.set(
      {
        'task' : task.getTaskTopic,
        'state': task.getState,
        'ID'   : newDoc.id,
      }
    );
    return newDoc.id.toString();
  }
  

  UpdateTaskInList(String taskListName, Task task){
    final firebase = FirebaseFirestore.instance;
    firebase
        .collection(_user!.email.toString())
        .doc(taskListName)
        .collection('Tasks')
        .doc(task.getId)
        .update({
          'task': task.getTaskTopic,
          'state': task.getState,
          'ID': task.getId,
        });
  }


  DeleteTaskInList(String taskListName, Task task){
    final firebase = FirebaseFirestore.instance;
    firebase
        .collection(_user!.email.toString())
        .doc(taskListName)
        .collection('Tasks')
        .doc(task.getId)
        .delete();
  }


  //--------------------------------
  // GET ALL THE ELEMENTS
  //--------------------------------
  getAllLists() async {
    final firebase = FirebaseFirestore.instance;
    CollectionReference _co = firebase.collection(_user!.email.toString());
    QuerySnapshot querySnapshot = await _co.get();
    List<dynamic> listName = querySnapshot.docs.map(
      (e){
        Map listName = e.data()! as Map<String,dynamic>;
        return listName['listName'];
      }
    ).toList();

    List<TaskList> tasklist = [];
    
    for (String i in listName) {
      CollectionReference _co2 = firebase.collection(_user!.email.toString())
                    .doc(i)
                    .collection('Tasks');
      
      QuerySnapshot querySnapshot2 = await _co2.get();
      List<Task> listOfTasks = [];

      for (var i in querySnapshot2.docs) {
        listOfTasks.add(Task.fromJSON(json: i.data()! as Map<String,dynamic>));
      }

      listOfTasks.length > 0 ? print(listOfTasks[0].getTaskTopic):print("no hay nada");
      tasklist.add(TaskList(nameList: i, ListOfTasks: listOfTasks));
    }
    return tasklist;

  }

}