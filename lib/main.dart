import 'dart:async';

import 'package:calorietracker/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calorie Tracker App', //change title of your app
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const SplashScreen(title: 'Calorie Tracker App',),
    );
  }
}

class SplashScreen extends StatefulWidget {
   const SplashScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const MainScreen()));
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/kCAL.png', height: 240,),
            const SizedBox(height: 5,),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            )
          ],
        ),
      ),
      );
  }
}
