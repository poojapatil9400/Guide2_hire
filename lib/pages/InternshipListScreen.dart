import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:place_vitaapp/pages/internshipgetter.dart';

class Internshipmain extends StatefulWidget {
  List internShipList;

  Internshipmain({super.key, required this.internShipList});

  @override
  State<Internshipmain> createState() => _InternshipMainState();
}

class _InternshipMainState extends State<Internshipmain> {
  List filteredInternshipList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list with the full list
    filteredInternshipList = widget.internShipList;
    searchController.addListener(onSearch);
  }

  @override
  void dispose() {
    searchController.removeListener(onSearch);
    searchController.dispose();
    super.dispose();
  }

  // Search logic to filter internships by company or location
  void onSearch() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredInternshipList = widget.internShipList.where((internship) {
        final company = internship['Company'].toString().toLowerCase();
        final location = internship['Location'].toString().toLowerCase();
        return company.contains(query) || location.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes default back button
        title: Text(
          'Internships',
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
      backgroundColor: Colors.grey[100], // Light background

      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search by company or location...',
                  hintStyle: GoogleFonts.quicksand(
                    fontSize: 16,
                    color: Colors.grey[500],
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 14, horizontal: 20),
                  prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                ),
              ),
            ),
          ),
          // Internship List
          Expanded(
            child: ListView.builder(
              itemCount: filteredInternshipList.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InternshipDetails(
                          InternshipList: filteredInternshipList,
                          itemIndex: index,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Company Logo
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              filteredInternshipList[index]['url'], // Dynamic image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Company Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${filteredInternshipList[index]['Company']}",
                                style: GoogleFonts.quicksand(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "${filteredInternshipList[index]['Location']}",
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
     ),
);
}
}
