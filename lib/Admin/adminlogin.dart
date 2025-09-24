import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:place_vitaapp/Admin/AdminNavBar.dart';
import 'package:place_vitaapp/Admin/adminSignup.dart';
import 'package:place_vitaapp/Admin/adminprofile.dart';
class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State {
  List<Map> Hakathone = [
    {
      "Name": "YouthTech Hackathon",
      "Location": "London, UK (In-person)",
      "Duration": "48 Hours",
      "Theme": "Innovation in Education Tech",
      "Eligibility": "Students aged 16-24 with an interest in EdTech.",
      "Prizes": "Grand Prize: £5,000 and mentoring from EdTech experts.",
      "RegistrationFee": "Free",
      "Description":
          "YouthTech Hackathon encourages young innovators to create technology solutions that can transform the education sector. The event will feature coding, workshops, and networking with industry leaders.",
      "Organizers": "YouthTech Foundation, London School of Economics",
      "ApplicationDeadline": "March 1, 2024"
    },
  ];

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Logo Placeholder
              Container(
                 alignment: Alignment.topLeft,
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.blue
                ], // Gradient for a vibrant look
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: Colors.black.withOpacity(0.8),
                width: 3,
              ),
              boxShadow: [
                // Outer shadow for 3D raised effect
                BoxShadow(
                  color: Colors.black.withOpacity(0.6), // Dark outer shadow
                  offset: const Offset(6, 6),
                  blurRadius: 12,
                ),
                // Inner glow effect
                BoxShadow(
                  color: Colors.white.withOpacity(0.3), // Light inner glow
                  offset: const Offset(-3, -3),
                  blurRadius: 6,
                  spreadRadius:
                      -4, // Negative spread for glow inside the container
                ),
              ],
            ),
            clipBehavior:
                Clip.hardEdge, // Ensures the image respects the border radius
            child: Stack(
              children: [
                // Image background
                Positioned.fill(
                  child: Image.asset(
                    "assets/login.png",
                    fit: BoxFit.cover, // Ensures the image fills the container
                  ),
                ),])),
              const SizedBox(height: 20),
              Text(
                'Admin Login',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField('Email', _emailController, Icons.email),
              const SizedBox(height: 20),
              _buildTextField('Password', _passwordController, Icons.lock,
                  obscureText: true),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  if (_emailController.text.trim().isNotEmpty &&
                      _passwordController.text.trim().isNotEmpty) {
                    try {
                      UserCredential userCredential =
                          await _firebaseAuth.signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      AdminProfileScreen.email = _emailController.text.trim();

                      for (int i = 0; i < Hakathone.length; i++) {
                        Map<String, dynamic> map = {};
                        map['Name'] = Hakathone[i]['Name'];
                        map['Location'] = Hakathone[i]['Location'];
                        map['Duration'] = Hakathone[i]['Duration'];
                        map['Theme'] = Hakathone[i]['Theme'];
                        map['Eligibility'] = Hakathone[i]['Eligibility'];
                        map['Prizes'] = Hakathone[i]['Prizes'];
                        map['Description'] = Hakathone[i]['Description'];
                        map['Organizer'] = Hakathone[i]['Organizer'];
                        map['ApplicationDeadline'] =
                            Hakathone[i]['ApplicationDeadline'];
                        await FirebaseFirestore.instance
                            .collection('Hakathone')
                            .doc(Hakathone[i]['Name'])
                            .set(map);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AdminNavBar(),
                        ),
                      );
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                   backgroundColor:  Color.fromARGB(255, 52, 137, 234),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminSignupScreen(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 300,
                  
                   decoration: BoxDecoration(
                    color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              
                border: Border.all(
                  color:  Color.fromARGB(255, 52, 137, 234),
                  width: 2,
                ),
                 boxShadow: [
      // Dark shadow for depth
      BoxShadow(
        color: Colors.black.withOpacity(0.5),
        offset: const Offset(4, 4), // Shadow position
        blurRadius: 8,
      ),
      // Light shadow for 3D effect
      BoxShadow(
        color: Colors.white.withOpacity(0.7),
        offset: const Offset(-4, -4), // Opposite direction
        blurRadius: 8,
      ),
    ],
              ),
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      IconData icon, {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.deepPurple[700],
          fontSize: 16,
        ),
        prefixIcon: Icon(icon, color: Colors.deepPurple[400]),
        filled: true,
        fillColor: Colors.deepPurple[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.deepPurple[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.deepPurple[600]!),
        ),
      ),
      cursorColor: Colors.deepPurple,
    );
  }
}
