import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class companydetails extends StatefulWidget {
  final dynamic itemIndex;
  final List companyList;

  companydetails({Key? key, required this.companyList, required this.itemIndex})
      : super(key: key);

  @override
  State<companydetails> createState() => _companydetailsState();
}

class _companydetailsState extends State<companydetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Company Details',
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
                title: "Company Name",
                content: "${widget.companyList[widget.itemIndex]['Name']}",
              ),
              buildDetailCard(
                title: "Location",
                content: "${widget.companyList[widget.itemIndex]['Location']}",
              ),
              buildDetailCard(
                title: "Cost Of Company",
                content:
                    "${widget.companyList[widget.itemIndex]['CostOfCompany']}",
              ),
              buildDetailCard(
                title: "Stipend",
                content: "${widget.companyList[widget.itemIndex]['Stipend']}",
              ),
              buildDetailCard(
                title: "Description",
                content:
                    "${widget.companyList[widget.itemIndex]['Description']}",
              ),
              buildDetailCard(
                title: "Eligible Course",
                content:
                    "${widget.companyList[widget.itemIndex]['EligibleCourse']}",
              ),
              buildDetailCard(
                title: "Eligibility Criteria",
                content:
                    "${widget.companyList[widget.itemIndex]['ECriteria']}",
              ),
              buildDetailCard(
                title: "Registration Schedule",
                content:
                    "${widget.companyList[widget.itemIndex]['RSchedule']}",
              ),
              buildDetailCard(
                title: "About The Organisation",
                content:
                    "${widget.companyList[widget.itemIndex]['Organisation']}",
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
    width: double.infinity, // Ensures the card takes the full width of its parent
    child: Card(
      shape: RoundedRectangleBorder(
         side: BorderSide(color: Colors.blue, width: 1), 
        borderRadius: BorderRadius.circular(15),
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
                color: const Color.fromARGB(255, 9, 9, 9),
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
