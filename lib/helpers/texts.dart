// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';

import 'Colors/randomColors.dart';




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


Text Title20(String texto){
  return Text(
    texto,
    style: GoogleFonts.lato(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: my_Colors.black
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

Text Title18_2(String texto){
  return Text(
    texto,
    maxLines: 2,
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
      fontWeight: FontWeight.bold,
    ),
  );
}


Text little_text_counter_normal(String texto){
  return Text(
    texto,
    style: GoogleFonts.lato(
      fontSize: 12,
      color: my_Colors.green,
      fontWeight: FontWeight.bold,
    ),
  );
}


Text little_text_word_counter(String texto, String max){
  return Text(
    texto+"/"+ max,
    style: GoogleFonts.lato(
      fontSize: 10,
      color: my_Colors.light_grey,
    ),
  );
}


Text task_text14(String texto){
  return Text(
    texto,
    overflow: TextOverflow.ellipsis,
    style: GoogleFonts.roboto(
      fontSize: 14,
      color: my_Colors.black,
    ),
  );
}



Text task_text14_done(String texto){
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


Text text16_bold(String texto){
  return Text(
    texto,
    style: GoogleFonts.roboto(
      color: my_Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold
    ),
  );
}


Text info_text(String texto){
  return Text(
    texto,
    textAlign: TextAlign.left,
    style: GoogleFonts.roboto(
      color: my_Colors.black,
      fontSize: 14,
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
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        b,
        style: GoogleFonts.roboto(
          fontSize: fs,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}


Row counter_text_normal(String a, String b, double fs, Color color){
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


Row celebration(){
  
  return Row(
    children: <Widget>[
      Text("You have finished all your taks"),
      Spacer(),
      Padding(
        padding: const EdgeInsets.only(right:10.0),
        child: Icon(Icons.celebration, color: R_Colors().listOfRColors()[Random().nextInt(10)]),
      ),
    ],



  );



}