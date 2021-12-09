import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget circle_percent(double percent, double hw, double fs){


  return Container(

      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[

          Container(
            width:hw,
            height: hw,
            child: new CircularProgressIndicator(
              strokeWidth: 5,
              value: percent,
              color: Color(0xff06D6A0),
            ),
          ),

          Text(
              (percent * 100).toInt().toString()+"%",
              style: GoogleFonts.roboto(
                fontSize: fs,
                color: Color(0xff202B57),

              ) ,
            ),
        ],
      ),

    );
}