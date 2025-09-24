import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:place_vitaapp/Admin/class%20CompanyFormWithFAB%20.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Admincompanyscreen extends StatefulWidget {
  const Admincompanyscreen({super.key});

  @override
  State<Admincompanyscreen> createState() => _AdmincompanyscreenState();
}

class _AdmincompanyscreenState extends State<Admincompanyscreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _stipendController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _eligibleCourseController =
      TextEditingController();
  final TextEditingController _criteriaController = TextEditingController();
  final TextEditingController _scheduleController = TextEditingController();
  final TextEditingController _organisationController = TextEditingController();
  final TextEditingController _urlController =
      TextEditingController(); // New URL Controller

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes default back button
        title: Text(
          'Company Details',
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
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 16,
              left: 16,
              right: 16,
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize:
                      MainAxisSize.min, // Adjust size based on content
                  children: [
                    buildFormField(
                      controller: _nameController,
                      label: "Company Name",
                      hint: "Enter company name",
                    ),
                    buildFormField(
                      controller: _locationController,
                      label: "Location",
                      hint: "Enter company location",
                    ),
                    buildFormField(
                      controller: _costController,
                      label: "Cost Of Company",
                      hint: "Enter cost of company",
                    ),
                    buildFormField(
                      controller: _stipendController,
                      label: "Stipend",
                      hint: "Enter stipend amount",
                    ),
                    buildFormField(
                      controller: _descriptionController,
                      label: "Description",
                      hint: "Enter company description",
                    ),
                    buildFormField(
                      controller: _eligibleCourseController,
                      label: "Eligible Course",
                      hint: "Enter eligible course(s)",
                    ),
                    buildFormField(
                      controller: _criteriaController,
                      label: "Eligibility Criteria",
                      hint: "Enter eligibility criteria",
                    ),
                    buildFormField(
                      controller: _scheduleController,
                      label: "Registration Schedule",
                      hint: "Enter registration schedule",
                    ),
                    buildFormField(
                      controller: _organisationController,
                      label: "About The Organisation",
                      hint: "Enter details about the organisation",
                    ),
                    buildFormField(
                      controller: _urlController, // URL field
                      label: "Company URL",
                      hint: "Enter company website URL",
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade600,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final companyDetails = {
                              'Name': _nameController.text,
                              'Location': _locationController.text,
                              'CostOfCompany': _costController.text,
                              'Stipend': _stipendController.text,
                              'Description': _descriptionController.text,
                              'EligibleCourse': _eligibleCourseController.text,
                              'ECriteria': _criteriaController.text,
                              'RSchedule': _scheduleController.text,
                              'Organisation': _organisationController.text,
                              'url': _urlController.text, // URL field added
                            };
                            Map<String, dynamic> data = {
                              "Name": _nameController.text.trim(),
                              'Location': _locationController.text.trim(),
                              'CostOfCompany': _costController.text.trim(),
                              'Stipend': _stipendController.text.trim(),
                              'Description': _descriptionController.text.trim(),
                              'EligibleCourse':
                                  _eligibleCourseController.text.trim(),
                              'ECriteria': _criteriaController.text.trim(),
                              'RSchedule': _scheduleController.text.trim(),
                              'Organisation':
                                  _organisationController.text.trim(),
                              'url': _urlController.text.trim(),
                            };
                            await _firebaseFirestore
                                .collection("Companies")
                                .doc(_nameController.text)
                                .set(data);

                            // Process the data (e.g., save to database)
                            print(companyDetails);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Company details saved successfully!",
                                  style: GoogleFonts.quicksand(),
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );

                            // Close the bottom sheet
                            Navigator.pop(context);
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

  Widget buildFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.quicksand(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.purple.shade700,
          ),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: Colors.purple.shade50,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label cannot be empty';
          }
          return null;
        },
      ),
    );
  }
}
