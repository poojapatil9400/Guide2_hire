import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminInternshipData extends StatefulWidget {
  @override
  State<AdminInternshipData> createState() => _InternshipDetailsState();
}

class _InternshipDetailsState extends State<AdminInternshipData> {
  final _formKey = GlobalKey<FormState>();
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Controllers for each field
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();
  final TextEditingController _eligibilityController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  final TextEditingController _perksController = TextEditingController();
  final TextEditingController _stipendController = TextEditingController();
  final TextEditingController _workAreaController = TextEditingController();
  final TextEditingController _urlController =
      TextEditingController(); // URL Controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false, // Removes default back button
        title: Text(
          'Internships Details',
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
                offset: Offset(0, 6), // Shadow below the AppBar
                blurRadius: 12,
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildFormField(_companyController, "Company Name"),
                        buildFormField(_locationController, "Location"),
                        buildFormField(_durationController, "Duration"),
                        buildFormField(_descriptionController, "Description"),
                        buildFormField(
                            _deadlineController, "Application Deadline"),
                        buildFormField(_eligibilityController, "Eligibility"),
                        buildFormField(_skillsController, "Skills Required"),
                        buildFormField(_perksController, "Perks"),
                        buildFormField(_stipendController, "Stipend"),
                        buildFormField(_workAreaController, "Work Area"),
                        buildFormField(_urlController,
                            "url"), // Ensure URL field is added here
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
                                // Check if the URL field is empty and assign a default value if needed
                                final String url = _urlController.text
                                        .trim()
                                        .isEmpty
                                    ? "assets/default.png" // Default assets URL
                                    : _urlController.text.trim();

                                final AdmininternshipData = {
                                  "Company": _companyController.text.trim(),
                                  "Location": _locationController.text.trim(),
                                  "Duration": _durationController.text.trim(),
                                  "Description":
                                      _descriptionController.text.trim(),
                                  "ApplicationDeadline":
                                      _deadlineController.text.trim(),
                                  "Eligibility":
                                      _eligibilityController.text.trim(),
                                  "SkillsRequired":
                                      _skillsController.text.trim(),
                                  "Perks": _perksController.text.trim(),
                                  "Stipend": _stipendController.text.trim(),
                                  "WorkArea": _workAreaController.text.trim(),
                                  "url":
                                      url, // Use the default or user-provided URL
                                };

                                await _firebaseFirestore
                                    .collection("Internships")
                                    .doc(_companyController.text.trim())
                                    .set(AdmininternshipData);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        "Internship details added successfully!"),
                                    backgroundColor: Colors.green,
                                  ),
                                );

                                // Clear form after submission
                                _formKey.currentState!.reset();
                                Navigator.pop(
                                    context); // Close the bottom sheet after submission
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
      ),
      
    );
  }

  // Helper function to build reusable form fields
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
