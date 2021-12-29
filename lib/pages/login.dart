// ignore_for_file: camel_case_types
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_to_do/Log/google_sign_in.dart';
import 'package:my_to_do/helpers/Colors/colorss.dart';
import 'package:my_to_do/helpers/buttons.dart';
import 'package:my_to_do/helpers/texts.dart';
import 'package:my_to_do/main.dart';
import 'package:provider/provider.dart';



class Log_In_Page extends StatefulWidget {
  Log_In_Page({Key? key}) : super(key: key);

  @override
  _Log_In_PageState createState() => _Log_In_PageState();
}

class _Log_In_PageState extends State<Log_In_Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: my_Colors.white,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){

          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.hasError){
            return Center(child: Text("Something went wrong"),);
          }else if(snapshot.hasData){
            return main_screen();
          }else{
            return all_screen_log(context);
          }

          
        },
      ),
    );
  }

  SingleChildScrollView all_screen_log(BuildContext context) {
    return SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          color: my_Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 115,
                ),
                Image(
                  image: AssetImage('assets/to-do-login.png'),
                  height: 200,
                ),
                SizedBox(
                  height: 45,
                ),
                Align(alignment: Alignment.centerLeft, child: Main_title()),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: little_text_normal("Keep yourself tidy")),
                SizedBox(
                  height: 40,
                ),
                // Container(
                //   width: 300,
                //   child: TextField(
                //     decoration: InputDecoration(
                //       enabledBorder: UnderlineInputBorder(
                //         borderSide: BorderSide(color: my_Colors.deep_grey),
                //       ),
                //       focusedBorder: UnderlineInputBorder(
                //         borderSide: BorderSide(color: my_Colors.green),
                //       ),
                //       prefixIcon: Icon(
                //         Icons.alternate_email,
                //         color: my_Colors.green,
                //         size: 18,
                //       ),
                //       hintText: "Email ID",
                //       hintStyle: GoogleFonts.roboto(
                //         fontSize: 14,
                //         color: my_Colors.deep_grey,
                //         fontStyle: FontStyle.italic,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   width: 300,
                //   child: TextField(
                //     decoration: InputDecoration(
                //       enabledBorder: UnderlineInputBorder(
                //         borderSide: BorderSide(color: my_Colors.deep_grey),
                //       ),
                //       focusedBorder: UnderlineInputBorder(
                //         borderSide: BorderSide(color: my_Colors.green),
                //       ),
                //       prefixIcon: Icon(
                //         Icons.lock_outline_sharp,
                //         color: my_Colors.green,
                //       ),
                //       hintText: "Password",
                //       hintStyle: GoogleFonts.roboto(
                //         fontSize: 14,
                //         color: my_Colors.deep_grey,
                //         fontStyle: FontStyle.italic,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 35,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 60),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       GestureDetector(
                //           onTap: () {
                //             //ToDo registrar al usuario y enviarlo a la página principal
                //           },
                //           child: registerText("Sign in")),
                //       Spacer(),
                //       loginButton(),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 45,
                ),
                Text(
                  "Login with",
                  style: GoogleFonts.roboto(
                      color: my_Colors.deep_grey,
                      fontStyle: FontStyle.italic,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    
                    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                    provider.googleLogin();
    
                    
    
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: 200,
                    height: 60,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                        color: my_Colors.light_grey,
                        width: 1,
                      )),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/google.png'),
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            registerText("Google Account"),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  }
}
