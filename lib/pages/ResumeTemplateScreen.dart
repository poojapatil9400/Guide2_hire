import 'package:flutter/material.dart';
import 'package:place_vitaapp/pages/resumedata.dart';
import 'package:place_vitaapp/pages/resumepreview.dart';

class ResumeTemplateScreen extends StatefulWidget {
  const ResumeTemplateScreen({super.key, required ResumeData resumeData, required String resumeType});

  @override
  _ResumeTemplateScreenState createState() => _ResumeTemplateScreenState();
}

class _ResumeTemplateScreenState extends State<ResumeTemplateScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController linkedInController = TextEditingController();
  final TextEditingController githubController = TextEditingController();
  final TextEditingController schoolingController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController projectTitleController = TextEditingController();
  final TextEditingController projectDescriptionController = TextEditingController();
  final TextEditingController achievementsController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  final TextEditingController involvementsController = TextEditingController();
  final TextEditingController certificationsController = TextEditingController();
  final TextEditingController internshipsController = TextEditingController();
  final TextEditingController schoolingInstitutionController = TextEditingController();
  final TextEditingController schoolingDurationController = TextEditingController();
  final TextEditingController degreeInstitutionController = TextEditingController();
  final TextEditingController degreeDurationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50, // Light purple background for better aesthetics
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField('Name', nameController),
            _buildTextField('Phone Number', phoneController),
            _buildTextField('Email', emailController),
            _buildTextField('LinkedIn Profile URL', linkedInController),
            _buildTextField('GitHub Profile URL', githubController),

            _buildSectionHeader('Education'),
            _buildEducationTable(),

            _buildSectionHeader('Projects'),
            _buildBulletedTextField('Project Title', projectTitleController),
            _buildBulletedTextField('Project Description', projectDescriptionController),

            _buildSectionHeader('Achievements'),
            _buildBulletedTextField('Achievements (Comma-separated)', achievementsController),

            _buildSectionHeader('Skills'),
            _buildBulletedTextField('Skills (Comma-separated)', skillsController),

            _buildSectionHeader('Involvements'),
            _buildBulletedTextField('Involvements (Comma-separated)', involvementsController),

            _buildSectionHeader('Certifications'),
            _buildBulletedTextField('Certifications (Comma-separated)', certificationsController),

            _buildTextField('Internships (Comma-separated)', internshipsController),

            const SizedBox(height: 30),

            // Save and Navigate Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final resumeData = ResumeData(
                    name: nameController.text,
                    contact: Contact(
                      phone: phoneController.text,
                      email: emailController.text,
                      linkedIn: linkedInController.text,
                      github: githubController.text,
                    ),
                    education: [
                      Education(
                        degree: schoolingController.text,
                        institution: schoolingInstitutionController.text,
                        duration: schoolingDurationController.text,
                        details: '',
                      ),
                      Education(
                        degree: degreeController.text,
                        institution: degreeInstitutionController.text,
                        duration: degreeDurationController.text,
                        details: '',
                      ),
                    ],
                    projects: [
                      Project(
                        title: projectTitleController.text,
                        description: projectDescriptionController.text,
                        duration: '',
                      ),
                    ],
                    skills: skillsController.text.split(','),
                    certifications: certificationsController.text.split(','),
                    awards: achievementsController.text.split(','),
                    internships: internshipsController.text.split(','),
                    title: '',
                    profileImage: '',
                    profileSummary: '',
                    experience: [],
                    languagesKnown: [],
                    involvements: involvementsController.text.split(','),
                  );

                  // Navigate to the ResumePreviewScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResumePreviewScreen(resumeData: resumeData),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  backgroundColor: Colors.purple.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Preview Resume',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple.shade700),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter your $label',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple.shade700),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildBulletedTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple.shade700),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter your $label (separate items with commas)',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple.shade700),
            ),
          ),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple.shade700),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 2,
          width: 50,
          color: Colors.purple.shade300,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildEducationTable() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildTextField('Board', schoolingController)),
            const SizedBox(width: 10),
            Expanded(child: _buildTextField('University', degreeController)),
          ],
        ),
        Row(
          children: [
            Expanded(child: _buildTextField('Qualification (eg. SSC)', schoolingInstitutionController)),
            const SizedBox(width: 10),
            Expanded(child: _buildTextField('Qualification (eg. B.E.)', degreeInstitutionController)),
          ],
        ),
        Row(
          children: [
            Expanded(child: _buildTextField('Year of Passing', schoolingDurationController)),
            const SizedBox(width: 10),
            Expanded(child: _buildTextField('Year of Passing', degreeDurationController)),
          ],
        ),
      ],
    );
  }
}
