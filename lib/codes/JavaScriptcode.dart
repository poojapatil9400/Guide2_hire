import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const JavaScriptcode());
}

class JavaScriptcode extends StatefulWidget {
  const JavaScriptcode({super.key});
  @override
  State createState() => _JavaScriptcodeState();
}

class _JavaScriptcodeState extends State {
  List<Map<String, dynamic>> Codes = [
    {
      'question': 'What is Flutter?',
      'answer':
          'Flutter is a mobile application development framework that allows developers to create high-performance, beautiful, and responsive mobile applications for multiple platforms using a single codebase.',
    },
    {
      'question': 'What is Dart, and why is it used in Flutter?',
      'answer':
          'Dart is a client-side programming language that is used in Flutter for developing mobile applications. Dart is used in Flutter because of the following reasons Dart is optimized for client-side development, which makes it perfect for mobile app development. Dart is a modern programming language that is easy to learn and use. Dart is a compiled language, which means that it is faster than interpreted languages like JavaScript. Dart has a sound-type system, which makes it easy to write and maintain large-scale applications.',
    },
    {
      'question': 'What is Hot Reload in Flutter?',
      'answer':
          'Hot Reload allows Flutter developers to instantly see the changes they make in their code on the simulator or real device. This significantly improves the development speed by eliminating the need to restart the app after every change.',
    },
    {
      'question': 'What are Flutter Widgets?',
      'answer':
          'Widgets in Flutter are the basic building blocks of the application. They describe how the user interface should look and behave. Widgets are immutable and describe the configuration for an element of the UI.',
    },
    {
      'question':
          'What is the difference between StatelessWidget and StatefulWidget?',
      'answer':
          'A StatelessWidget is immutable, meaning its properties cannot change once the widget is built. A StatefulWidget, on the other hand, can change its state and re-render when necessary.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A1B9A), // Custom purple color
        title: Text(
          "JavaScript Interview Questions",
          style: GoogleFonts.quicksand(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        elevation: 5,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: Codes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue, width: 3), 
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      shadowColor: Colors.grey.withOpacity(0.3),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Codes[index]['question'],
                              style: GoogleFonts.quicksand(
                                color: const Color(
                                    0xFF4A148C), // Dark purple color for question
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              Codes[index]['answer'],
                              style: GoogleFonts.quicksand(
                                color: Colors.black87,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                height:
                                    1.6, // Line height for better readability
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
     ),
);
}
}
