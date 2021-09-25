// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/main.dart';
import 'package:my_to_do/helpers/my_style.dart';

class Write_Task extends StatelessWidget {
  

  
  
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(

      body: SafeArea(

        child: Container(



          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.all(30.0),
                child: TextField(
                  autofocus: true,
                  style: GoogleFonts.roboto(
                    color: my_Colors.text_color_main,
                    fontSize: 18
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none
                  ),
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 6,
              
              
              
              
              
                ),
              )



            ],
          ),
        ),
      ),



      floatingActionButton: FloatingActionButton(
        onPressed: () => backTo_main(context),

        child: Icon(
          Icons.arrow_back_ios_sharp,
          color: my_Colors.background_color_white,
          
        ),
        backgroundColor: my_Colors.background_color_blue,
        
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      
    );
  
  }



  
}


void backTo_main(BuildContext context) {
    
    Navigator.popAndPushNamed(context, "/");

}