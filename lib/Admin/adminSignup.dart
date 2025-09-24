import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:place_vitaapp/pages/LoginScreen.dart';
import 'package:place_vitaapp/pages/snackbar.dart';

class AdminSignupScreen extends StatefulWidget {
  const AdminSignupScreen({super.key});

  @override
  _AdminSignupScreenState createState() => _AdminSignupScreenState();
}

class _AdminSignupScreenState extends State {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _experienceController = TextEditingController();

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
              Text(
                'Signup',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[800],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              _buildTextField('Name', _nameController, Icons.person),
              const SizedBox(height: 20),
              _buildTextField('Email', _emailController, Icons.email,
                  inputType: TextInputType.emailAddress),
              const SizedBox(height: 20),
              _buildTextField('Password', _passwordController, Icons.lock,
                  obscureText: true),
              const SizedBox(height: 20),
              _buildTextField('Role', _experienceController, Icons.star),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  try {
                    if (_nameController.text.trim().isNotEmpty &&
                        _emailController.text.trim().isNotEmpty &&
                        _passwordController.text.trim().isNotEmpty &&
                        _experienceController.text.trim().isNotEmpty) {
                      UserCredential _userCredential = await _firebaseAuth
                          .createUserWithEmailAndPassword(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim());

                      Map<String, dynamic> data = {
                        "Name": _nameController.text.trim(),
                        "Email": _emailController.text.trim(),
                        "Password": _passwordController.text.trim(),
                        "Experience": _experienceController.text.trim(),
                      };

                      CustomSnackbar.showCustomSnackbar(
                          message: "User Registered Successfully",
                          context: context);
                      FirebaseFirestore.instance
                          .collection("AdminSignupData")
                          .doc(_emailController.text.trim())
                          .set(data);

                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    } else {
                      CustomSnackbar.showCustomSnackbar(
                          message: "Please enter valid fields", context: context);
                    }
                  } on FirebaseAuthException catch (e) {
                    CustomSnackbar.showCustomSnackbar(
                        message: e.message ?? "Signup failed!",
                        context: context);
                  }
                },
                style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.purple.shade700,
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
                  'Sign Up',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
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
      IconData icon, {TextInputType inputType = TextInputType.text, bool obscureText = false}) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(
          color: Colors.deepPurple[700],
          fontSize: 16,
        ),
        prefixIcon: Icon(icon, color: Colors.deepPurple),
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
