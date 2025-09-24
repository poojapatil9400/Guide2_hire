import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:place_vitaapp/pages/LoginScreen.dart';
import 'package:place_vitaapp/pages/snackbar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _collegeController = TextEditingController();
  final _branchController = TextEditingController();
  final _skillsController = TextEditingController();
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
              _buildTextField('College/University', _collegeController, Icons.school),
              const SizedBox(height: 20),
              _buildTextField('Branch', _branchController, Icons.account_tree),
              const SizedBox(height: 20),
              _buildTextField('Skills (Optional)', _skillsController, Icons.lightbulb),
              const SizedBox(height: 20),
              _buildTextField('Experience (Optional)', _experienceController, Icons.star),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  try {
                    if (_nameController.text.trim().isNotEmpty &&
                        _emailController.text.trim().isNotEmpty &&
                        _passwordController.text.trim().isNotEmpty &&
                        _collegeController.text.trim().isNotEmpty &&
                        _branchController.text.trim().isNotEmpty &&
                        _skillsController.text.trim().isNotEmpty &&
                        _experienceController.text.trim().isNotEmpty) {
                      UserCredential _userCredential = await _firebaseAuth
                          .createUserWithEmailAndPassword(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim());

                      Map<String, dynamic> data = {
                        "Name": _nameController.text.trim(),
                        "Email": _emailController.text.trim(),
                        "Password": _passwordController.text.trim(),
                        "College/University": _collegeController.text.trim(),
                        "Branch": _branchController.text.trim(),
                        "Skills": _skillsController.text.trim(),
                        "Experience": _experienceController.text.trim(),
                      };

                      CustomSnackbar.showCustomSnackbar(
                          message: "User Registered Successfully",
                          context: context);
                      FirebaseFirestore.instance
                          .collection("SignupData")
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
