// ignore_for_file: camel_case_types

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_to_do/helpers/route_generators.dart';
import 'visual/main_visual.dart';

void main() {


  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,



    // main route of the app
    initialRoute: '/',

    // In the file "route_generates" are all the routes used in the app
    onGenerateRoute: RouteGenerator.generateRoute,

  ));
}

class main_screen extends StatefulWidget {
  @override
  _main_screenState createState() => _main_screenState();

  
}

class _main_screenState extends State<main_screen> {
  @override
  Widget build(BuildContext context) {
    // Change statusBar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff1B76FF),
    ));

    return Scaffold(
      //start the screen
      body: SafeArea(
        child: Container(
          // Background color
          color: Color(0xffFFFFFF),
          // it divides all the elements into a column
          child: Column(
            // The full column will take all the space in the
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Line 1
              title(),

              // Line 2
              line_text("Lists", "0 lists"),

              // Línea 3 de elementos en lista
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Row(
                  children: <Widget>[
                    // When there are lists

                    // When they are NOT lists
                    no_lists()
                  ],
                ),
              ),

              // Línea 4
              line_text("Instant tasks", "0 tasks"),

              // When -instant tasks- is empty
              no_instant_tasks(),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _goTo_list_of_lists,
        child: Icon(
          Icons.add,
          color: Color(0xffFFFFFF),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void _goTo_list_of_lists() {
    
    Navigator.of(context).pushNamed('/list_lists');

  }
}

void spider() {}
