import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: main_screen(),
  ));
}

class main_screen extends StatefulWidget {
  @override
  _main_screenState createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  @override
  Widget build(BuildContext context) {



    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Color(0xff1B76FF),
        )
    );



    return Scaffold(

      body: SafeArea(

        child: Container(

          child: Column(

            children: <Widget>[

              //Primera línea, texto de la app
              Padding(
                padding: EdgeInsets.only(top: 15.0, left:15.0),
                
                
                child: Row(
                  children: <Widget>[
                    new Icon(
                      Icons.arrow_back_ios, 
                      color: Color(0xff202B57), 
                      size: 18.0),
              
                    new Text(
                      "Tasks",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff202B57),
                      ),
                    )
                  ],
                )
              ),

              //Second line

              Padding(
                padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 40.0),

                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text("Lists", style: TextStyle(fontSize: 14.0, color: Color(0xffA9AECD)))),
                    new Text("0 lists", style: TextStyle(fontSize: 14.0, color: Color(0xffA9AECD)))
                  ],
                ),
              ),



              Padding(
                padding: EdgeInsets.only(top:20.0, left: 10.0, right: 10.0),
                child: Row(
                  children: <Widget>[


                    // Cuando está vacío entonces pongo esto
                    Card(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Image(
                              image: AssetImage('assets/relax2.png'),
                              width: 128,
                              height: 128,
                            ),
                            )
                        ],
                      ),
                    )

                  ],
                ),
              )








            ],



            ),
          ),
      ),
    );
  }
}
