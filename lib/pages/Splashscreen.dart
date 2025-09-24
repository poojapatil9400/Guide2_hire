import 'package:flutter/material.dart';
import 'package:place_vitaapp/view/choice.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void navigate(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Homescreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    navigate(context);
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration:const  BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey, const Color.fromARGB(255, 94, 96, 96)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Circular image with shadow
                Container(
                  height: 300,
                  width: 300,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.grey.shade200],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ), // Adds a subtle gradient for a polished look
                    boxShadow: [
                      const BoxShadow(
                        color: Colors.black38, // Darker shadow for depth
                        blurRadius: 30,
                        offset: Offset(
                            0, 15), // Larger offset for a prominent shadow
                      ),
                      BoxShadow(
                        color:
                            Colors.white.withOpacity(0.5), // Highlight effect
                        blurRadius: 10,
                        offset: const Offset(-5,-5), // Opposite direction for a light reflection
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Circular Image
                      Positioned.fill(
                        child: Image.asset(
                          "assets/guide.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Optional Gradient Overlay for a glossy effect
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.2),
                              ],
                              radius: 0.8,
                              center:
                                  Alignment.topLeft, // Simulates a light source
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
