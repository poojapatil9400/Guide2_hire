import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Hakathonedetails extends StatefulWidget {
  final dynamic itemIndex;
  final List Hackathon;

  Hakathonedetails({Key? key, required this.Hackathon, required this.itemIndex})
      : super(key: key);

  @override
  State<Hakathonedetails> createState() => _HakathonedetailsState();
}

class _HakathonedetailsState extends State<Hakathonedetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hackathon Details',
          style: GoogleFonts.quicksand(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple.shade600,
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Colors.deepPurple[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDetailCard(
                title: "Name",
                content: "${widget.Hackathon[widget.itemIndex]['Name']}",
              ),
              buildDetailCard(
                title: "Location",
                content: "${widget.Hackathon[widget.itemIndex]['Location']}",
              ),
              buildDetailCard(
                title: "Duration",
                content: "${widget.Hackathon[widget.itemIndex]['Duration']}",
              ),
              buildDetailCard(
                title: "Theme",
                content: "${widget.Hackathon[widget.itemIndex]['Theme']}",
              ),
              buildDetailCard(
                title: "Eligibility",
                content: "${widget.Hackathon[widget.itemIndex]['Eligibility']}",
              ),
              buildDetailCard(
                title: "Prizes",
                content: "${widget.Hackathon[widget.itemIndex]['Prizes']}",
              ),
              buildDetailCard(
                title: "Description",
                content: "${widget.Hackathon[widget.itemIndex]['Description']}",
              ),
              buildDetailCard(
                title: "Organizers",
                content: "${widget.Hackathon[widget.itemIndex]['Organizer']}",
              ),
              buildDetailCard(
                title: "Application Deadline",
                content:
                    "${widget.Hackathon[widget.itemIndex]['ApplicationDeadline']}",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to create a detail card
  Widget buildDetailCard({required String title, required String content}) {
    return SizedBox(
      width: double.infinity, // Ensures the card takes full width
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
           side: BorderSide(color: Colors.blue, width: 1), 
        ),
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 16),
        color: Colors.purple.shade50,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 14, 14, 15),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.purple.shade700,
                ),
              ),
            ],
          ),
        ),
     ),
);
}
}
