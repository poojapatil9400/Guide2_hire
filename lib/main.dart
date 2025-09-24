import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:place_vitaapp/pages/Splashscreen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options:  const FirebaseOptions(
     apiKey: "AIzaSyCT0QkHzW5cAfXyHo2EOq1eAFn2FCND6O8", 
     appId:"1:383046324443:android:93f6d7a86793b8df84fcfe" ,
     messagingSenderId: "383046324443", 
     projectId: "placevitaapp")
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static String email="";
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}
