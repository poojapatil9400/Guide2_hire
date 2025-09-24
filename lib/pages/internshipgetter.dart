import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InternshipDetails extends StatefulWidget {
  final dynamic itemIndex;
  final List InternshipList;

  InternshipDetails({Key? key, required this.InternshipList, required this.itemIndex})
      : super(key: key);

  @override
  State<InternshipDetails> createState() => _InternshipDetailsState();
}

class _InternshipDetailsState extends State<InternshipDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Internship Details',
          style: GoogleFonts.quicksand(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple.shade600,
        elevation: 4,
      ),
      backgroundColor: Colors.purple.shade50,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Reusable 3D-styled card for each detail
                buildDetailCard(
                  title: "Company Name",
                  content: "${widget.InternshipList[widget.itemIndex]['Company']}",
                ),
                buildDetailCard(
                  title: "Location",
                  content: "${widget.InternshipList[widget.itemIndex]['Location']}",
                ),
                buildDetailCard(
                  title: "Duration",
                  content: "${widget.InternshipList[widget.itemIndex]['Duration']}",
                ),
                buildDetailCard(
                  title: "Description",
                  content: "${widget.InternshipList[widget.itemIndex]['Description']}",
                ),
                buildDetailCard(
                  title: "Application Deadline",
                  content:
                      "${widget.InternshipList[widget.itemIndex]['ApplicationDeadline']}",
                ),
                buildDetailCard(
                  title: "Eligibility",
                  content: "${widget.InternshipList[widget.itemIndex]['Eligibility']}",
                ),
                buildDetailCard(
                  title: "Skills Required",
                  content:
                      "${widget.InternshipList[widget.itemIndex]['SkillsRequired']}",
                ),
                buildDetailCard(
                  title: "Perks",
                  content: "${widget.InternshipList[widget.itemIndex]['Perks']}",
                ),
                buildDetailCard(
                  title: "Stipend",
                  content: "${widget.InternshipList[widget.itemIndex]['Stipend']}",
                ),
                buildDetailCard(
                  title: "Work Area",
                  content: "${widget.InternshipList[widget.itemIndex]['WorkArea']}",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to create a reusable 3D-styled card
  Widget buildDetailCard({required String title, required String content}) {
    return SizedBox(
      width: 350, // Fixed width for all cards
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          
    border: Border.all(
      color: Colors.blue, // Blue border color
      width: 3.0,         // Border width
    ),
          gradient: LinearGradient(
            colors: [Colors.purple.shade100, Colors.purple.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.shade200,
              blurRadius: 6,
              offset: Offset(4, 4), // Adds a 3D shadow effect
            ),
            BoxShadow(
              color: Colors.white,
              blurRadius: 6,
              offset: Offset(-4, -4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.quicksand(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 19, 19, 19),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.purple.shade800,
                ),
              ),
            ],
          ),
        ),
     ),
);
}
}
