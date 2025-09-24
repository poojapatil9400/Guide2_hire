import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:place_vitaapp/Admin/adminlogin.dart';
import 'package:place_vitaapp/view/choice.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});
  static String email = '';

  @override
  _AdminProfileScreenState createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  // Controllers for form fields
  final _AnameController = TextEditingController();
  final _AemailController = TextEditingController();
  final _ApasswordController = TextEditingController();
  final _AexperienceController = TextEditingController();

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
    _AnameController.dispose();
    _AemailController.dispose();
    _ApasswordController.dispose();
    _AexperienceController.dispose();
    super.dispose();
  }

  // Fetch profile details from Firestore
  Future<void> _profileDetailsMapGetter() async {
    try {
      DocumentSnapshot response = await FirebaseFirestore.instance
          .collection('AdminSignupData')
          .doc(AdminProfileScreen.email)
          .get();

      if (response.exists) {
        final data = response.data() as Map<String, dynamic>;

        setState(() {
          _AnameController.text = data['Name'] ?? '';
          _AemailController.text = data['Email'] ?? '';
          _AexperienceController.text = data['Experience'] ?? '';
          _ApasswordController.text = data['Password'] ?? '';
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
    final String name = _AnameController.text.trim();
    final String email = _AemailController.text.trim();
    final String password = _ApasswordController.text.trim();
    final String experience = _AexperienceController.text.trim();

    if (name.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty) {
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
                  const SizedBox(height: 40),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blue[100],
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: Color.fromARGB(255, 52, 137, 234),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Profile",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 52, 137, 234),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildProfileField('Name', _AnameController, Icons.person),
                  const SizedBox(height: 15),
                  _buildProfileField('Email', _AemailController, Icons.email,
                      inputType: TextInputType.emailAddress),
                  const SizedBox(height: 15),
                  _buildProfileField(
                    'Password',
                    _ApasswordController,
                    Icons.lock,
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  _buildProfileField(
                    'Experience (Optional)',
                    _AexperienceController,
                    Icons.star_border,
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Homescreen(),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 160,
                       decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 52, 137, 234), // Light Blue
          Color.fromARGB(255, 25, 103, 210), // Dark Blue
        ],
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
                      child: Text(
                        "Logout",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Color.fromARGB(255, 52, 137, 234)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 52, 137, 234)),
          ),
          filled: true,
          fillColor: Colors.blue[50],
        ),
      ),
    );
  }
}
