import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Import the carousel_slider package

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State createState() {
    return _AdminHomeScreenState();
  }
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  // Track the current index of the carousel
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Guide2Hire",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 6,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 20,),
              // Carousel Section with Enhanced Design
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.vertical(bottom: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(0, 5),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 250,
                        viewportFraction: 0.6,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        autoPlayInterval: const Duration(seconds: 1),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 300),
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: [
                       
                        _buildCarouselItem('assets/wipro.png', 'Wipro'),
                        _buildCarouselItem('assets/infosys.png', 'Infosys'),
                        _buildCarouselItem('assets/Apple_Img.png', 'Apple'),
                      ],
                    ),
                    const SizedBox(height: 15),
                    // Custom indicators for carousel
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          width: _currentIndex == index ? 12.0 : 8.0,
                          height: _currentIndex == index ? 12.0 : 8.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? Colors.blueAccent
                                : const Color.fromARGB(255, 198, 9, 9),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
          
              // Total Employee and Interns Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      "Total Users",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "15",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w800,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Total Interns",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "13",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w800,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
          
              // Companies and Internship Cards in a Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStatCard("Companies", "10", Colors.deepOrange),
                  const SizedBox(width: 40),
                  _buildStatCard("Internships", "8", Colors.green),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build each carousel item with overlay caption
  Widget _buildCarouselItem(String imagePath, String caption) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
            height: 250,
            width: double.infinity,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              caption,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Helper method to build each statistic card with modern design
  Widget _buildStatCard(String title, String count, Color color) {
    return Expanded(
      child: Container(
        height: 250,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.8), color.withOpacity(0.6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              offset: Offset(2, 4),
              blurRadius: 12,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Text(
                count,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: color,
                ),
              ),
            ),
          ],
        ),
     ),
);
}
}
