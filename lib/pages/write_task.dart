// ignore_for_file: non_constant_identifier_names, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';

class Write_Task extends StatefulWidget {
  // Elementos que se le envían a esta clase
  Task task;
  Write_Task({required this.task});

  @override
  State<Write_Task> createState() => _Write_TaskState();
}

class _Write_TaskState extends State<Write_Task> {
  TextEditingController myController = new TextEditingController();
  bool editado = false;

  // if it gets a state FALSE is a new one, if it's a TRUE is already a task
  bool escribirNuevo = false;

  @override
  void initState() {
    super.initState();
    myController.text = widget.task.taskTopic;
  }

  @override
  Widget build(BuildContext context) {
    String originalText = widget.task.taskTopic;
    escribirNuevo = widget.task.getState;

    return WillPopScope(
      onWillPop: () async {
        // Refresh the info in the next page
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(30.0),
                child: TextField(
                  controller: myController,
                  onChanged: (text) {
                    setState(() {
                      originalText == text ? editado = false : editado = true;
                    });
                  },
                  autofocus: escribirNuevo ? false : true,
                  style: GoogleFonts.roboto(
                      color: my_Colors.text_color_main, fontSize: 18),
                  decoration: InputDecoration(border: InputBorder.none),
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 6,
                ),
              )
            ],
          ),
        ),
        floatingActionButton: widget.task.getTaskTopic != ""
            ?
            // When it has to read a task
            FloatingActionButton.extended(
                label: Text("Update task"),
                onPressed: () {
                  if (editado && myController.text.isNotEmpty) {
                    widget.task.setTaskTopic = myController.text.trim();
                    widget.task.setState = true;
                    backTo_main(context);
                  } else if (myController.text.isEmpty || editado == false) {
                    backTo_main(context);
                  }
                },
                icon: Icon(editado ? Icons.edit : Icons.edit_off,
                    color: my_Colors.background_color_white),
                backgroundColor: my_Colors.background_color_blue,
              )
            :

            // When it's a new task
            FloatingActionButton.extended(
                label: Text("Add task"),
                onPressed: () {
                  if (editado && myController.text.isNotEmpty) {
                    widget.task.setTaskTopic = myController.text.trim();
                    widget.task.setState = true;
                    backTo_main(context);
                  } else if (myController.text.isEmpty || editado == false) {
                    backTo_main(context);
                  }
                },
                icon: Icon(editado ? Icons.edit : Icons.keyboard_arrow_up,
                    color: my_Colors.background_color_white),
                backgroundColor: my_Colors.background_color_blue,
              ),
        floatingActionButtonLocation: widget.task.getTaskTopic != ""
            ? FloatingActionButtonLocation.centerFloat
            : FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

void backTo_main(BuildContext context) {
  Navigator.popAndPushNamed(context, "/");
}
