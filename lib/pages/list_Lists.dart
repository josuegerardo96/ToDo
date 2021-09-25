// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:my_to_do/helpers/my_style.dart';
import '../visual/main_visual.dart';



class list_of_Lists extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
        body: SafeArea(
          child: Container(
            

            color: my_Colors.background_color_white,

            child: Column(

              children: <Widget>[


                new GestureDetector(
                  
                  onTap:(){
                    Navigator.popAndPushNamed(context, "/");

                  },

                  child: title()


                  
                ),


                line_text("Lists", "0 lists"),
                no_list_in_lists(),


                

                



                


              ],



            ),







          )),



          floatingActionButton: FloatingActionButton(
        onPressed: ()=>{},
        child: Icon(
          Icons.add, color: my_Colors.background_color_white,
        ),
      ),
      );






  }
}