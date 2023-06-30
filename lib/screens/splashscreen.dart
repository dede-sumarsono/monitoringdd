
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:monitoringdd/screens/home_screen.dart';
import 'package:monitoringdd/screens/login_screen.dart';
import 'package:monitoringdd/utils/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 4000),(){
      //Navigator.push(context, MaterialPageRoute(builder: (contex)=>HomeScreen()));
      Navigator.push(context, MaterialPageRoute(builder: (contex)=>LoginScreen()));
    });




  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ orangeColor, orangeLightColor],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
        ),
        child: Center(
            child: Image.asset("assets/img/notary.png")),
      ),
    );
  }
}
