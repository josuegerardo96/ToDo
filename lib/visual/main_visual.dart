import 'dart:ui';
import 'package:flutter/material.dart';
import '../main.dart';




// The title
class title extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
              
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
                ),


                




                
              ],


              
            )
          );
  }
}






// Lines of text like:    Lists ............. 0 lists
class line_text extends StatelessWidget{
  String text;
  String count_text;
  line_text(this.text, this.count_text);


  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 40.0),

                child: Row(
                  children: <Widget>[

                    Expanded(
                      child: new Text(
                        this.text, 
                        style: TextStyle(
                          fontSize: 14.0, 
                          color: Color(0xffA9AECD)
                        )
                      )
                    ),


                    Text(
                      this.count_text, 
                      style: TextStyle(
                        fontSize: 14.0, 
                        color: Color(0xffA9AECD)
                      )
                    )
                  ],
                ),
              );

  }
}








// Card shown when there is any list created
class no_lists extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),


                        child: Card(

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)
                          ),

                          color: Color(0xffF9FAFF),



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
                                          color: Color(0xffA9AECD)
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
                                          onPressed: spider, 
                                          child: new Text("New list", style: TextStyle(fontSize: 14.0, color: Color(0xffFFFFFF)))),
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
}




// Card that shows there's nothing in the instant tasks
class no_instant_tasks extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return Expanded(


        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Card(
                    color: Color(0xffF9FAFF),
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
                              color: Color(0xffA9AECD)
                            ),
                          ),



                          SizedBox(height: 20.0),


                          ElevatedButton(
                            onPressed: spider, 
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0))),
                            child: new Text(
                              "New task", 
                              style: TextStyle(
                                fontSize: 14.0, 
                                color: Color(0xffFFFFFF),
                                
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
}







class no_list_in_lists extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return Expanded(


        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Card(
                    color: Color(0xffF9FAFF),
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
                              color: Color(0xffA9AECD)
                            ),
                          ),



                          SizedBox(height: 20.0),


                          ElevatedButton(
                            onPressed: spider, 
                            style: ElevatedButton.styleFrom(
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20.0))),
                            child: new Text(
                              "New list", 
                              style: TextStyle(
                                fontSize: 14.0, 
                                color: Color(0xffFFFFFF),
                                
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
}


