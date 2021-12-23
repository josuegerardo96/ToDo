// ignore_for_file: non_constant_identifier_names

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