// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';
import 'package:my_to_do/helpers/buttons.dart';
import 'package:my_to_do/helpers/texts.dart';


//---------------------
// MAIN SCREEN
//---------------------

// Card shown when there is any list in the main screen
Container NoListsInMain(){

  return Container(

    width: 300,
    height: 130,

    
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: my_Colors.light_grey,
          width: 1,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image(
            image: AssetImage('assets/relax3.png'),
            height: 90,
            width: 90,
          ),

          SizedBox(width: 20,),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              text16_bold("You have no lists"),
              SizedBox(height: 10,),
              float_button(
               "Add list",
               Icon(Icons.add, color: my_Colors.white, size: 20), 
               my_Colors.green, 
               30, 
               100, 0)
            ],
          )


        ],
      ),
),


  );

}


// Card shown when INSTANT TASKS is empty
Container NoInstantTasks(){
  return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          Column(
            children: <Widget>[
              Image(
                image: AssetImage('assets/relax.png'),
                height: 120,
                width: 120,
              ),    
              SizedBox(height: 5.0),        
              text16_bold("You have nothing to do"),
            ],
          )
        ],
      ),
  );
}






//---------------------
// Screen List
//---------------------
// Empty space in the screen of list of lists
Container NoLists(){
  return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/relax3.png'),
            height: 100,
            width: 100,
          ),
      
          SizedBox(height: 20.0),
          
          text16_bold("You have nothing to do"),
          
        ],
      ),
  );
}


Container NotaksInList(){
  return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/relax3.png'),
            height: 100,
            width: 100,
          ),
      
          SizedBox(height: 20.0),
          
          text16_bold("You have nothing to do"),
          
        ],
      ),
  );
}


