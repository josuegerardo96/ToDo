// ignore_for_file: non_constant_identifier_names, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';
import 'package:my_to_do/helpers/buttons.dart';

class Write_Task extends StatefulWidget {
  // Elementos que se le envían a esta clase
  String task;
  Write_Task({required this.task});
  @override
  State<Write_Task> createState() => _Write_TaskState();
}

class _Write_TaskState extends State<Write_Task> {
  TextEditingController writing_task = new TextEditingController();
  bool editado = false;
  bool escribirNuevo = false;
  String originalText = "";
  

  @override
  void initState() {
    super.initState();
    originalText = widget.task;
    writing_task.text = widget.task;
    widget.task == "" ?
      escribirNuevo = true:
      escribirNuevo = false;
  }

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, "");
        return true;
      },

      child: Scaffold(
        body: SafeArea(
          
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(30.0),

                    child: TextField(
                      controller: writing_task,
                      onChanged: (text) {
                        setState(() {
                          originalText == text ? 
                            editado = false: 
                            editado = true;
                          print(editado.toString());
                        });
                      },
                      decoration: InputDecoration(border: InputBorder.none),
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 6,
                      autofocus: escribirNuevo ? true : false,
                      style: GoogleFonts.roboto(
                          color: my_Colors.black, 
                          fontSize: 18
                      ),
                    ),
                  )
                ],
              ),


              // Float button

              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    
                    onTap: (){

                      if(escribirNuevo == false && editado == false){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("You have not done a change"),
                            duration: const Duration(seconds: 4),
                          )
                        );
                      }else if(writing_task.text.trim().isNotEmpty){
                        Navigator.pop(context, writing_task.text.trim());
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("You have no written a task"),
                            duration: const Duration(seconds: 4),
                          )
                        );
                      }
                    },
              
                    child: 
                    escribirNuevo ?
                    // If you're creating a new task
                    float_button(
                      "Add task", 
                      Icon(Icons.keyboard_arrow_up_outlined, color: my_Colors.white,), 
                      my_Colors.green, 
                      50, 
                      120, 
                      10):

                      // If you have to update the task
                      float_button(
                      "Update task", 
                      Icon(Icons.update, color: my_Colors.white,), 
                      my_Colors.deep_grey, 
                      50, 
                      160, 
                      10)
                  ),
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
