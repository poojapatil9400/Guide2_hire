import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:place_vitaapp/Admin/adminlogin.dart';
import 'package:place_vitaapp/pages/LoginScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
                       child: Image.asset(
                      "assets/login3.png",
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover, // Ensures the image fills the container
                    ),
            ),
          ),
          SizedBox(height: 50,),
          Text(
            "Login Your Choice",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 40),
          SizedBox(
            width: 340,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 52, 137, 234),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10))),
              child: Text(
                "User Login",
                style: TextStyle(
                    color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: 340,
            height: 55,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminLoginScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))

                  //backgroundColor: Color.white,
                  ),
              child: Text(
                "Admin Login",
                style: TextStyle(
                    color: Color.fromRGBO(44, 130, 199, 1),
                    fontSize: 20),
              ),
            ),
          )
        ],
     ),
);
}
}
