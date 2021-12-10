// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_to_do/Objects/taskList.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/helpers/my_style.dart';



class write_List extends StatefulWidget {

  taskListModel listOfTasks;
  write_List({Key? key, required this.listOfTasks}) : super(key: key);

  @override
  _write_ListState createState() => _write_ListState();
}




class _write_ListState extends State<write_List> {
  TextEditingController myController = new TextEditingController();
  bool editado = false;

  bool escribirNuevo = false;


  @override
  void initState() {
    super.initState();
    myController.text = widget.listOfTasks.getNameList;
  }
  

  @override
  Widget build(BuildContext context) {
  String originalText = widget.listOfTasks.getNameList;

  // if the original text is empty that means it is a new item to add
  originalText == "" ? escribirNuevo = false : escribirNuevo = true;
  

  return Scaffold(
        

        body: SafeArea(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
          
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: TextField(
                    controller: myController,
                    onChanged: (text){
                      setState(() {
    
                        originalText == text ? editado = false : editado = true;

                      });
                    },
                    // is it new? yes: don't focus --- no: focus
                    autofocus: escribirNuevo ? false : true, 

                    maxLength: 60,

                    
        
                    style: GoogleFonts.roboto(
                      color: my_Colors.text_color_main,
                      fontSize: 18
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      
                    ),
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 6,
                
                  ),
                )
              ],
            ),
          ),
        ),


        
        floatingActionButton: FloatingActionButton.extended(

          
          onPressed: (){
            
            if(editado && myController.text.isNotEmpty){
              
              // ToDo Agregar función de cambio en la base de datos


              // ToDo Arreglar problema de Index del problema en cuestión


              widget.listOfTasks.setNameList = myController.text.trim();
              backTo_listOfLists(context);

            }else if(myController.text.isEmpty || editado==false){
              backTo_listOfLists(context);
            }
            
          },

          label: Text("Add list"),
          icon: Icon( editado ? Icons.edit : Icons.keyboard_arrow_up, color: my_Colors.background_color_white),
          backgroundColor: my_Colors.background_color_blue,
          

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        
      );
    
    }
}


void backTo_listOfLists(BuildContext context) {
    Navigator.popAndPushNamed(context, "/list_lists");
}