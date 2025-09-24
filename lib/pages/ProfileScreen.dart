import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:place_vitaapp/pages/LoginScreen.dart';
import 'package:place_vitaapp/view/choice.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static String email = '';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Controllers for form fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _collegeController = TextEditingController();
  final _branchController = TextEditingController();
  final _skillsController = TextEditingController();
  final _experienceController = TextEditingController();

  bool _isLoading = true; // To handle loading state

  @override
  void initState() {
    super.initState();

    // Fetch profile details after the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _profileDetailsMapGetter();
    });
  }

  @override
  void dispose() {
    // Dispose controllers to release resources
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _collegeController.dispose();
    _branchController.dispose();
    _skillsController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  // Fetch profile details from Firestore
  Future<void> _profileDetailsMapGetter() async {
    try {
      DocumentSnapshot response = await FirebaseFirestore.instance
          .collection('SignupData')
          .doc(ProfileScreen.email)
          .get();

      if (response.exists) {
        final data = response.data() as Map<String, dynamic>;

        setState(() {
          _nameController.text = data['Name'] ?? '';
          _branchController.text = data['Branch'] ?? '';
          _collegeController.text = data['College/University'] ?? '';
          _emailController.text = data['Email'] ?? '';
          _experienceController.text = data['Experience'] ?? '';
          _passwordController.text = data['Password'] ?? '';
          _skillsController.text = data['Skills'] ?? '';
          _isLoading = false; // Data has been loaded
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        print("Document does not exist.");
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Error fetching profile details: $e");
    }
  }

  // Update profile data
  void _updateProfile() {
    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    final String college = _collegeController.text.trim();
    final String branch = _branchController.text.trim();
    final String skills = _skillsController.text.trim();
    final String experience = _experienceController.text.trim();

    if (name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        college.isNotEmpty &&
        branch.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile updated successfully!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all required fields.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator()) // Show loader while data is fetching
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.deepPurple[100],
                    child: Icon(Icons.person, size: 50, color: Colors.deepPurple),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Profile",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildProfileField('Name', _nameController, Icons.person),
                  const SizedBox(height: 15),
                  _buildProfileField('Email', _emailController, Icons.email,
                      inputType: TextInputType.emailAddress),
                  const SizedBox(height: 15),
                  _buildProfileField(
                      'Password', _passwordController, Icons.lock,
                      obscureText: true),
                  const SizedBox(height: 15),
                  _buildProfileField(
                      'College/University', _collegeController, Icons.school),
                  const SizedBox(height: 15),
                  _buildProfileField(
                      'Branch', _branchController, Icons.account_tree),
                  const SizedBox(height: 15),
                  _buildProfileField('Skills', _skillsController,
                      Icons.lightbulb),
                  const SizedBox(height: 15),
                  _buildProfileField('Experience',
                      _experienceController, Icons.star_border),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Homescreen(),
                          ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      child: Text(
                        "Logout",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.deepPurple, Colors.purpleAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  // Helper function to build profile input fields
  Widget _buildProfileField(String label, TextEditingController controller,
      IconData icon,
      {TextInputType inputType = TextInputType.text,
      bool obscureText = false}) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.deepPurple),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.deepPurple),
        ),
        filled: true,
        fillColor: Colors.deepPurple[50],
      ),
    );
  }
}
