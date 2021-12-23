// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';


Container float_button(String texto, Icon icon, Color color){

  return Container(
    width: 120,
    height: 50,
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: color,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            SizedBox(width:5),
            Text(
              texto,
              style: GoogleFonts.roboto(
                color: my_Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),

      ),
    ),
  );
}