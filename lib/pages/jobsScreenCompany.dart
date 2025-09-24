import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class jobsScreenCompany extends StatefulWidget {
  final dynamic itemIndex;

  const jobsScreenCompany({Key? key, required this.itemIndex})
      : super(key: key);

  @override
  State<jobsScreenCompany> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<jobsScreenCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Company Name:",
                  style: GoogleFonts.quicksand(
                    fontSize: 24, // Custom font size
                    fontWeight: FontWeight.w700, // Custom font weight
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  // height: 60,
                  width: 400,
          
                  child: Text(
                    'Google',
                    style: GoogleFonts.quicksand(
                      fontSize: 20, // Custom font size
                      fontWeight: FontWeight.w400, // Custom font weight
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Location :",
                  style: GoogleFonts.quicksand(
                    fontSize: 24, // Custom font size
                    fontWeight: FontWeight.w700, // Custom font weight
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  // height: 60,
                  width: 400,
                  
                  child: Text(
                    'Pune',
                    style: GoogleFonts.quicksand(
                      fontSize: 20, // Custom font size
                      fontWeight: FontWeight.w400, // Custom font weight
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Cost Of Company :",
                  style: GoogleFonts.quicksand(
                    fontSize: 24, // Custom font size
                    fontWeight: FontWeight.w700, // Custom font weight
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  // height: 60,
                  width: 400,
                 
                  child: Text(
                    'CTC 10,00000',
                    style: GoogleFonts.quicksand(
                      fontSize: 20, // Custom font size
                      fontWeight: FontWeight.w400, // Custom font weight
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Stipend:",
                  style: GoogleFonts.quicksand(
                    fontSize: 24, // Custom font size
                    fontWeight: FontWeight.w700, // Custom font weight
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  // height: 60,
                  width: 400,
                 
                  child: Text(
                    '150000',
                    style: GoogleFonts.quicksand(
                      fontSize: 20, // Custom font size
                      fontWeight: FontWeight.w400, // Custom font weight
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Description :",
                  style: GoogleFonts.quicksand(
                    fontSize: 24, // Custom font size
                    fontWeight: FontWeight.w700, // Custom font weight
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  // height: 60,
                  width: 400,
                  
                   
                    // Optional: rounded corners
                  
                  child: Text(
                    "Google is one of the most well-known and influential technology companies in the world.Founded in 1998 by Larry Page and Sergey Brin while they were Ph.D. students at Stanford University, Google originally started as a search engine with the mission to organize the world’s information and make it universally accessible and useful.",
                    style: GoogleFonts.quicksand(
                      fontSize: 20, // Custom font size
                      fontWeight: FontWeight.w400, // Custom font weight
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Eligible Course:",
                  style: GoogleFonts.quicksand(
                    fontSize: 24, // Custom font size
                    fontWeight: FontWeight.w700, // Custom font weight
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  // height: 60,
                  width: 400,
                  
                  child: Text(
                    "BE.Computer /t BE It",
                    style: GoogleFonts.quicksand(
                      fontSize: 20, // Custom font size
                      fontWeight: FontWeight.w400, // Custom font weight
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Eligiblity Criteria:",
                  style: GoogleFonts.quicksand(
                    fontSize: 24, // Custom font size
                    fontWeight: FontWeight.w700, // Custom font weight
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  // height: 60,
                  width: 400,
                  
                  child: Text(
                    "7.5 In Engineering with no Active BackLogs",
                    style: GoogleFonts.quicksand(
                      fontSize: 20, // Custom font size
                      fontWeight: FontWeight.w400, // Custom font weight
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Registriration Schedule:",
                  style: GoogleFonts.quicksand(
                    fontSize: 24, // Custom font size
                    fontWeight: FontWeight.w700, // Custom font weight
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  // height: 60,
                  width: 400,
                  
                  child: Text(
                    "opens:11.00 Am, 24-Oct-2024",
                    style: GoogleFonts.quicksand(
                      fontSize: 20, // Custom font size
                      fontWeight: FontWeight.w400, // Custom font weight
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                
                Text(
                  "About The Organisation :",
                  style: GoogleFonts.quicksand(
                    fontSize: 24, // Custom font size
                    fontWeight: FontWeight.w700, // Custom font weight
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  // height: 60,
                  width: 400,
                  
                  child: Text(
                    " It/Computer Software:",
                    style: GoogleFonts.quicksand(
                      fontSize: 20, // Custom font size
                      fontWeight: FontWeight.w600, // Custom font weight
                    ),
                  ),

                  
                ),
                const SizedBox(height: 20),
              ],
            ),
     ),
));
}
}
