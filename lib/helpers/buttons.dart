// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';

Container float_button(
    String texto, Icon icon, Color color, double hei, double wid, double bord) {
  return Container(
    width: wid,
    height: hei,
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(bord),
      ),
      color: color,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            SizedBox(width: 5),
            Text(
              texto,
              style: GoogleFonts.roboto(
                  color: my_Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}


Container add_list_button(){
  return Container(

    width: 30,
    height: 30,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: my_Colors.green,
    ),
    child: Icon(Icons.add, color: my_Colors.white,),

  );
}