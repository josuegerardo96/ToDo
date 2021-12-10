import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:my_to_do/Objects/taskList.dart';
import 'package:my_to_do/Objects/task_circle.dart';
import 'package:my_to_do/helpers/my_style.dart';



class create_list_of_lists extends StatelessWidget {


  List <taskListModel> myLists;
  create_list_of_lists(this.myLists);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount: myLists.length,
      itemBuilder: (context, index){
        taskListModel list = myLists[index];
        return list_of_lists_Style(list, index);
      },
    );
  }
}



class list_of_lists_Style extends StatefulWidget {

  taskListModel myLists;
  int index;
  list_of_lists_Style(this.myLists, this.index);

  @override
  _list_of_lists_StyleState createState() => _list_of_lists_StyleState();
}




class _list_of_lists_StyleState extends State<list_of_lists_Style> {




  @override
  Widget build(BuildContext context) {

    List<taskModel> lista = widget.myLists.ListOfTasks;
    int allDone = lista.where((e)=> e.getState==false).length;
    



    return Container(
      height: 150.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0),
    
      child: new GestureDetector(

        onTap: (){

          Navigator.of(context).pushNamed("/tasks_in_list", arguments: widget.myLists);

        },



        child: Card(
          
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: my_Colors.background_color_task,
          elevation: 0.2,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
          
              children: <Widget>[
      
          
                 Expanded(
                   flex:6,
                   child: Column(
                     
                     children: <Widget>[
                       
                       Expanded(
                         flex: 7,
                         child: Align(
                           alignment: Alignment.centerLeft,
                           child: Text(
                             widget.myLists.getNameList,
                             overflow: TextOverflow.ellipsis,
                             maxLines: 3,
                             style: GoogleFonts.roboto(
                               fontSize: 18.0,
                               color: my_Colors.text_color_main,
                               textStyle: TextStyle(fontWeight: FontWeight.bold),
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
      
      
      
                 Expanded(
                   flex:4,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: <Widget>[
                       
                      
                       circle_percent(allDone/widget.myLists.sizeListOfTasks, 60.0, 12.0),
                 
                       SizedBox(height: 10.0),
                 
                        
                       Text(allDone.toString()+" / "+widget.myLists.sizeListOfTasks.toString(), style: GoogleFonts.roboto(color: my_Colors.tex_color_grey, fontSize: 12),)
                 
                 
                     ],
                   ),
                 )
          
          
          
          
          
              ],
          
          
          
          
            ),
          ),
          
          
        ),
      ),
    
    
    
    
    
    
    
    
    );
  }
}