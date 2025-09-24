import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CompanyFormWithFAB {
  BuildContext context;
  CompanyFormWithFAB({required this.context}) {
    _showBottomSheet(context);
  }
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

  // Function to show the bottom sheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Allows the bottom sheet to take up more height
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (BuildContext context) {
        return SizedBox();
      },
    );
  }

  // Helper method to create a form field
  
}
