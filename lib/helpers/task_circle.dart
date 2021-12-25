// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';

Widget circle_percent(double percent, double hw, double fs){


  return Container(

      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[

          Container(
            width:hw,
            height: hw,
            child: new CircularProgressIndicator(
              strokeWidth: 4,
              value: percent,
              color: Color(0xff06D6A0),
            ),
          ),

          Text(
              (percent * 100).toInt().toString()+"%",
              style: GoogleFonts.roboto(
                fontSize: fs,
                color: Color(0xff06D6A0),

              ) ,
            ),
        ],
      ),

    );
}


Container Circle_Counter(double percent, double hw, double fs, Color color){


  return Container(

      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[


          Container(
            width:hw,
            height: hw,
            child: new CircularProgressIndicator(
              strokeWidth: 4,
              value: 1,
              color: my_Colors.light_grey,
            ),
          ),


          Container(
            width:hw,
            height: hw,
            child: new CircularProgressIndicator(
              strokeWidth: 4,
              value: percent,
              color: color,
            ),
          ),

          Text(
              (percent * 100).toInt().toString()+"%",
              style: GoogleFonts.roboto(
                fontSize: fs,
                color: color,

              ) ,
            ),
        ],
      ),

    );
}


Container Circle_Counter8(double percent, double hw, double fs, Color color){


  return Container(

      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[


          Container(
            width:hw,
            height: hw,
            child: new CircularProgressIndicator(
              strokeWidth: 8,
              value: 1,
              color: my_Colors.light_grey,
            ),
          ),


          Container(
            width:hw,
            height: hw,
            child: new CircularProgressIndicator(
              strokeWidth: 8,
              value: percent,
              color: color,
            ),
          ),

          Text(
              (percent * 100).toInt().toString()+"%",
              style: GoogleFonts.roboto(
                fontSize: fs,
                color: color,

              ) ,
            ),
        ],
      ),

    );
}
