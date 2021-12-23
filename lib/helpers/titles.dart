// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';

Widget title(){
  return Padding(      
    padding: EdgeInsets.only(top: 15.0, left:15.0),
    child: Row(
      children: <Widget>[
        new Icon(
          Icons.arrow_back_ios, 
          color: my_Colors.text_color_main, 
          size: 18.0),
  
        new Text(
          "Tasks",
          style: GoogleFonts.roboto(
            fontSize: 18.0,
            color: my_Colors.text_color_main,
          ),
        ),
      ],
    )
  );
}



// Lines of text like: 
// Lists ............. 0 lists
Widget line_text(String text, String count_text){
  return Padding(
      padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 40.0),
      child: Row(
        children: <Widget>[

          Expanded(
            child: new Text(
              text, 
              style: TextStyle(
                fontSize: 14.0, 
                color: my_Colors.tex_color_grey
              )
            )
          ),


          Text(
            count_text, 
            style: TextStyle(
              fontSize: 14.0, 
              color: my_Colors.tex_color_grey
            )
          )
        ],
      ),
    );
}