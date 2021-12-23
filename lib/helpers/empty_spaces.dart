// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';


//---------------------
// MAIN SCREEN
//---------------------

// Card shown when there is any list in the main screen
Expanded NoListsInMain(){
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),


        child: Card(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          color: my_Colors.background_color_task,



          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Row(
              children: <Widget>[
          
          
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Image(
                      image: AssetImage('assets/relax.png'),
                      width: 100,
                      height: 100,
                  ),
                ),
                
                            
                  
                Expanded(
                  child: Column(
                      
                    children: <Widget>[
                      Text(
                        "You have no lists",
                        style: TextStyle(
                          fontSize: 14.0, 
                          color: my_Colors.tex_color_grey
                        ),
                      ),
                            
                      Padding(
                        padding: EdgeInsets.only(top:10.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () => {}, 
                          child: new Text(
                            "New list", 
                            style: TextStyle(
                              fontSize: 14.0, 
                              color: my_Colors.background_color_white)
                            )
                          ),
                      )
                            
                              
                    ]
                  ),
                )
                            
                            
                            
              ],
            ),
          ),
        ),
      ),
    );

}


// Card shown when INSTANT TASKS is empty
Expanded NoInstantTasks(){
  return Expanded(
    child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Card(
                color: my_Colors.background_color_task,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),

                child: Padding(
                  padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 40.0),
                  child: Column(
                    children: <Widget>[
                
                
                      Image(
                        image: AssetImage('assets/relax3.png'),
                        height: 100,
                        width: 100,
                      ),
                
                      SizedBox(height: 20.0),
                      
                      Text(
                        "You got nothing to do",
                        style: TextStyle(
                          fontSize: 14.0, 
                          color: my_Colors.tex_color_grey
                        ),
                      ),



                      SizedBox(height: 20.0),


                      ElevatedButton(
                        onPressed: () => {}, 
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0))),
                        child: new Text(
                          "New task", 
                          style: TextStyle(
                            fontSize: 14.0, 
                            color: my_Colors.background_color_white,
                            
                          ),
                          
                        )
                      )
                    ],
                  ),
                )             
            )
          ],
        ),
    ),
  );
}






//---------------------
// Screen List
//---------------------
// Empty space in the screen of list of lists
Expanded NoLists(){
  return Expanded(
    child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Card(
                color: my_Colors.background_color_task,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),

                child: Padding(
                  padding: EdgeInsets.symmetric(vertical:20.0, horizontal: 40.0),
                  child: Column(
                    children: <Widget>[
                
                
                      Image(
                        image: AssetImage('assets/relax2.png'),
                        height: 100,
                        width: 100,
                      ),
                
                      SizedBox(height: 20.0),
                      
                      Text(
                        "You got nothing to do",
                        style: TextStyle(
                          fontSize: 14.0, 
                          color: my_Colors.tex_color_grey
                        ),
                      ),



                      SizedBox(height: 20.0),


                      ElevatedButton(
                        onPressed: () => {}, 
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0))),
                        child: new Text(
                          "New list", 
                          style: TextStyle(
                            fontSize: 14.0, 
                            color: my_Colors.background_color_white,
                          ),

                        )
                      )
                    ],
                  ),
                )
        
            )
          ],
        ),
    ),
  );
}


