import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:place_vitaapp/pages/CompanyDetailScreen.dart';
import 'package:place_vitaapp/pages/homeScreengetter.dart';

class JobsScreenMain extends StatefulWidget {
  List companyList;
  JobsScreenMain({super.key, required this.companyList});

  @override
  State<JobsScreenMain> createState() => _JobsScreenMainState();
}

class _JobsScreenMainState extends State<JobsScreenMain> {
  List filteredCompanyList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize filtered list with the full list
    filteredCompanyList = widget.companyList;
    searchController.addListener(onSearch);
  }

  @override
  void dispose() {
    searchController.removeListener(onSearch);
    searchController.dispose();
    super.dispose();
  }

  // Search logic
  void onSearch() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredCompanyList = widget.companyList.where((company) {
        final name = company['Name'].toString().toLowerCase();
        final location = company['Location'].toString().toLowerCase();
        return name.contains(query) || location.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.deepPurple[50], // Light purple background

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
                  hintText: 'Search by name or location...',
                  hintStyle: GoogleFonts.quicksand(
                    fontSize: 16,
                    color: Colors.deepPurple[200],
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 14, horizontal: 20),
                  prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                ),
              ),
            ),
          ),
          // Job List
          Expanded(
            child: ListView.builder(
              itemCount: filteredCompanyList.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => companydetails(
                          companyList: filteredCompanyList,
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
                            color: Colors.deepPurple[100],
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
                              filteredCompanyList[index]['url'], // Dynamic image
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
                                "${filteredCompanyList[index]['Name']}",
                                style: GoogleFonts.quicksand(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.deepPurple[900],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "${filteredCompanyList[index]['Location']}",
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.deepPurple[600],
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
