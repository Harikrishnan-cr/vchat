import 'dart:developer';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vchat/core/fonts/fonts.dart';
import 'package:vchat/view/chat_screen/chat_screen.dart';
import 'package:vchat/view/home/home_screen.dart';
import 'package:vchat/view/login_screen/login_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


bool user = false;

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
   isUserLogedIn(); 
    super.initState();
  }


  void isUserLogedIn(){
final fireBaseAuth = FirebaseAuth.instance; 
  try{
final isUserLog =  fireBaseAuth.currentUser;


if(isUserLog != null){
  log(isUserLog.email.toString()); 
setState(() {
  user = true; 
});
}

  }catch(e){
log(e.toString()); 
  }
}
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: Colors.white
        ),
        home: AnimatedSplashScreen(
          splashTransition: SplashTransition.fadeTransition,
            
            duration: 3000,
            splash: Column(
              children: [
                const Center(child: SplashHeading()), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: GoogleFont.splashScreenText,
                  child: AnimatedTextKit( 
                   
                   isRepeatingAnimation: false,
                    animatedTexts: [
                      TyperAnimatedText('WORLD\'S MOST PRIVATE CHATTING APP')
                    ],
                  ),
                )
              ],
            ),
              ],
            ),
            nextScreen: !user ? const HomeScreen() :  ChatScreen(),
            backgroundColor:const Color.fromRGBO(49, 27, 146, 1)));
  }
}


class SplashHeading extends StatelessWidget {
  const SplashHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Vchat',
      style: GoogleFont.splashScreenMainText, 
    );
  }
}