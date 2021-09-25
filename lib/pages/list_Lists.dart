// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:my_to_do/main.dart';
import '../visual/main_visual.dart';



class list_of_Lists extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    
      return Scaffold(
        body: SafeArea(
          child: Container(
            

            color: Color(0xffFFFFFF),

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
        onPressed: spider,
        child: Icon(
          Icons.add, color: Color(0xffFFFFFF),
        ),
      ),
      );






  }
}