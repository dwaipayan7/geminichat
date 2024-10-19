import 'package:flutter/material.dart';
import 'package:geminichat/onboarding.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen(3);
  }

  void splashScreen(int seconds){
    Future.delayed(Duration(seconds: seconds), ()=>{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Onboarding()))
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(child: Image.asset('assets/splashscreen.png'))
    );
  }
}
