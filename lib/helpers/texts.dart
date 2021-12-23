// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';




Text Main_title(){
  return Text(
    "My Tasks",
    style: GoogleFonts.lato(
      fontSize: 30,
      color: my_Colors.black,
      fontWeight: FontWeight.bold
    ),
  );
}



Text Title18(String texto){
  return Text(
    texto,
    style: GoogleFonts.lato(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: my_Colors.black
    ),
  );
}


Text little_text(String texto){
  return Text(
    texto,
    maxLines: 3,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.lato(
      fontSize: 14,
      color: my_Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}


Text little_text_counter(String texto){
  return Text(
    texto,
    style: GoogleFonts.lato(
      fontSize: 12,
      color: my_Colors.green,
    ),
  );
}


Text task_text16(String texto){
  return Text(
    texto,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.roboto(
      fontSize: 14,
      color: my_Colors.black,
    ),
  );
}



Text task_text16_done(String texto){
  return Text(
    texto,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.roboto(
      fontSize: 14,
      color: my_Colors.black,
      textStyle: TextStyle(decoration: TextDecoration.lineThrough)
    ),
  );
}





Row counter_text(String a, String b, double fs, Color color){
  return Row(
    children: <Widget>[
      Text(
        a + " / ",
        style: GoogleFonts.roboto(
          fontSize: fs,
          color: my_Colors.deep_grey,
        ),
      ),
      Text(
        b,
        style: GoogleFonts.roboto(
          fontSize: fs,
          color: color,
        ),
      ),
    ],
  );
}