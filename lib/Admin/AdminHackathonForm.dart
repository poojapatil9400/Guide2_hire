import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminHackathonForm extends StatefulWidget {
  @override
  State<AdminHackathonForm> createState() => _AdminHackathonFormState();
}

class _AdminHackathonFormState extends State<AdminHackathonForm> {
  final _formKey = GlobalKey<FormState>();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Controllers for the form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _themeController = TextEditingController();
  final TextEditingController _eligibilityController = TextEditingController();
  final TextEditingController _prizesController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _organizerController = TextEditingController();
  final TextEditingController _applicationDeadlineController =
      TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false, // Removes default back button
        title: Text(
          'Hackathon Details',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Visible against the gradient
            ),
          ),
        ),
        elevation: 10.0, // Adds depth with shadow
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30), // Enhanced rounded corners
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple.shade300,
                Colors.purple.shade600,
                Colors.purple.shade800,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(
              color: Colors.white.withOpacity(0.5), // Subtle border effect
              width: 1.5,
            ),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 6), // Shadow below the AppBar
                blurRadius: 12,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildFormField(_nameController, "Hackathon Name"),
                          buildFormField(_locationController, "Location"),
                          buildFormField(_durationController, "Duration"),
                          buildFormField(_themeController, "Theme"),
                          buildFormField(_eligibilityController, "Eligibility"),
                          buildFormField(_prizesController, "Prizes"),
                          buildFormField(_descriptionController, "Description"),
                          buildFormField(_organizerController, "Organizer"),
                          buildFormField(_applicationDeadlineController,
                              "Application Deadline"),
                          buildFormField(_urlController,
                              "url"), // Correctly added URL field

                          const SizedBox(height: 16),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple.shade600,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final hackathonData = {
                                    "Name": _nameController.text.trim(),
                                    "Location": _locationController.text.trim(),
                                    "Duration": _durationController.text.trim(),
                                    "Theme": _themeController.text.trim(),
                                    "Eligibility":
                                        _eligibilityController.text.trim(),
                                    "Prizes": _prizesController.text.trim(),
                                    "Description":
                                        _descriptionController.text.trim(),
                                    "Organizer":
                                        _organizerController.text.trim(),
                                    "ApplicationDeadline":
                                        _applicationDeadlineController.text
                                            .trim(),
                                    "url": _urlController.text
                                        .trim(), // Save the URL field
                                  };

                                  await _firebaseFirestore
                                      .collection("Hakathone")
                                      .doc(_nameController.text.trim())
                                      .set(hackathonData);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Hackathon details submitted successfully!"),
                                      backgroundColor: Colors.green,
                                    ),
                                  );

                                  // Optionally reset the form after submission
                                  _formKey.currentState!.reset();
                                }
                              },
                              child: Text(
                                'Submit',
                                style: GoogleFonts.quicksand(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
      ),
    );
  }

  // Helper function to create form fields
  Widget buildFormField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.quicksand(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.purple.shade800,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: Colors.purple.shade50,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "$label cannot be empty";
          }
          return null;
        },
     ),
);
}
}
