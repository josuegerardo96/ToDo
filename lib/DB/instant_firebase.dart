// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_to_do/Objects/task.dart';

class Instant_Firebase {
  final _user = FirebaseAuth.instance.currentUser;

  String Insert(Task task) {
    final firebase = FirebaseFirestore.instance;
    var newDoc = firebase
        .collection(_user!.email.toString())
        .doc('Instant')
        .collection('List of Instants')
        .doc();

    newDoc.set({
      'task': task.getTaskTopic,
      'state': task.getState,
      'ID': newDoc.id,
    });
    return newDoc.id.toString();
  }


  Update(Task task) {
    final firebase = FirebaseFirestore.instance;
    firebase
        .collection(_user!.email.toString())
        .doc('Instant')
        .collection('List of Instants')
        .doc(task.getId)
        .update({
      'task': task.getTaskTopic,
      'state': task.getState,
      'ID': task.getId,
    });
  }

  Delete(String taskID) {
    final firebase = FirebaseFirestore.instance;
    firebase
        .collection(_user!.email.toString())
        .doc('Instant')
        .collection('List of Instants')
        .doc(taskID)
        .delete();
  }

  Future<List<Task>> getAllTasks() async {
    final firebase = FirebaseFirestore.instance;
    CollectionReference _co = firebase
        .collection(_user!.email.toString())
        .doc('Instant')
        .collection('List of Instants');

    QuerySnapshot querySnapshot = await _co.get();
    List<Task> lista = querySnapshot.docs
        .map((e) => Task.fromJSON(json: e.data()! as Map<String, dynamic>))
        .toList();

    lista.sort((a, b) {
      if (a.getState == true) {
        return -1;
      } else {
        return 1;
      }
    });

    return lista;
  }
}
