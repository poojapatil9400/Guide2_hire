import 'package:flutter/material.dart';
import 'package:place_vitaapp/pages/resumedata.dart';
import 'package:google_fonts/google_fonts.dart';
class ResumePreviewScreen extends StatelessWidget {
  final ResumeData resumeData;

  const ResumePreviewScreen({super.key, required this.resumeData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Resume Preview',
        style: GoogleFonts.poppins(
      textStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Keeps the text visible against the purple theme
      ),),),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              _buildHeaderSection(),

              const SizedBox(height: 20),

              // Two-column Layout
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Column: Education, Projects, Achievements
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle('Education'),
                        _buildEducationSection(),

                        const SizedBox(height: 20),

                        _buildSectionTitle('Projects'),
                        _buildProjectsSection(),

                        const SizedBox(height: 20),

                        _buildSectionTitle('Achievements'),
                        _buildBulletedTextBlock(resumeData.awards.isNotEmpty
                            ? resumeData.awards
                            : ['No achievements added']),
                      ],
                    ),
                  ),

                  const SizedBox(width: 20),

                  // Second Column: Skills, Involvements, Certifications
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle('Skills'),
                        _buildBulletedTextBlock(resumeData.skills.isNotEmpty
                            ? resumeData.skills
                            : ['No skills added']),

                        const SizedBox(height: 20),

                        _buildSectionTitle('Involvements'),
                        _buildBulletedTextBlock(resumeData.involvements.isNotEmpty
                            ? resumeData.involvements
                            : ['No involvements added']),

                        const SizedBox(height: 20),

                        _buildSectionTitle('Certifications'),
                        _buildBulletedTextBlock(resumeData.certifications.isNotEmpty
                            ? resumeData.certifications
                            : ['No certifications added']),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name and Title
        Text(
          resumeData.name.isNotEmpty ? resumeData.name : 'Name',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        const SizedBox(height: 5),

        // Contact Information
        _buildContactInfo(),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (resumeData.contact.phone.isNotEmpty)
          Text('Phone: ${resumeData.contact.phone}',
              style: const TextStyle(fontSize: 16)),
        if (resumeData.contact.email.isNotEmpty)
          Text('Email: ${resumeData.contact.email}',
              style: const TextStyle(fontSize: 16)),
        if (resumeData.contact.linkedIn.isNotEmpty)
          Text('LinkedIn: ${resumeData.contact.linkedIn}',
              style: const TextStyle(fontSize: 16)),
        if (resumeData.contact.github.isNotEmpty)
          Text('GitHub: ${resumeData.contact.github}',
              style: const TextStyle(fontSize: 16)),
        const Divider(color: Colors.grey, thickness: 1, height: 20),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
    );
  }

  Widget _buildBulletedTextBlock(List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) {
          return Row(
            children: [
              const Icon(Icons.circle, size: 8, color: Colors.purple),
              const SizedBox(width: 5),
              Expanded(child: Text(item.trim(), style: const TextStyle(fontSize: 16))),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEducationSection() {
    return Table(
      border: TableBorder.all(color: Colors.purple, width: 1),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(2),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.purple[100]),
          children: [
            _buildTableCell('University/Board'),
            _buildTableCell('Qualification'),
            _buildTableCell('Year of Passing'),
          ],
        ),
        ...resumeData.education.map((education) {
          return TableRow(
            children: [
              _buildTableCell(education.degree),
              _buildTableCell(education.institution),
              _buildTableCell(education.duration),
            ],
          );
        }).toList(),
      ],
    );
  }

  Widget _buildTableCell(String content) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        content.isNotEmpty ? content : 'No information',
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  Widget _buildProjectsSection() {
    if (resumeData.projects.isEmpty) {
      return _buildTextBlock('No project details available');
    }

    List<Widget> projectWidgets = resumeData.projects.map((project) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          '${project.title}\n${project.description}',
          style: const TextStyle(fontSize: 16.5),
        ),
      );
    }).toList();

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: projectWidgets);
  }

  Widget _buildTextBlock(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Text(
        text.isNotEmpty ? text : 'No information provided',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
