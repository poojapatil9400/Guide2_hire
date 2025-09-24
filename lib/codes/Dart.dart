import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const DartCode());
}

class DartCode extends StatefulWidget {
  const DartCode({super.key});

  @override
  State createState() => _DartCodeState();
}

class _DartCodeState extends State<DartCode> {
  List<Map<String, dynamic>> Codes = [
    {
      'question': 'What is Dart?',
      'answer':
          'Dart is a programming language designed for building mobile, web, and desktop applications. It is developed by Google and can also be used to build server applications.',
    },
    {
      'question': 'What are the data types in Dart?',
      'answer':
          'Dart data types include a number (int, double, num), string, Boolean, list, and map.',
    },
    {
      'question': 'What is the difference between final and const?',
      'answer':
          'Const: Value must be known at compile-time, const birthday = "2008/12/25" and it can\'t be changed after initialized.  Final: Value must be known at run-time, final birthday = getBirthDateFromDB() and it can\'t be changed after initialized.',
    },
    {
      'question': 'What is sound null safety in Dart?',
      'answer':
          'Dart’s null safety is sound, which enables compiler optimizations. If the type system determines that something isn’t null, then that thing can never be null.',
    },
    {
      'question': 'What is the late keyword used for?',
      'answer':
          'The late keyword is used to indicate that a variable will be initialized later but it cannot be null.',
    },
    {
      'question': 'What are async, await, and Future in Dart?',
      'answer':
          'In Dart, Async means that this function is asynchronous, and you might need to wait a bit to get its result. Await literally means — wait here until this function is finished and you will get its return value. Future is a type that returns a value from your asynchronous function.',
    },
    {
      'question': 'What is assert in Dart?',
      'answer':
          'Assert statements are useful for debugging a Dart project. It is used mainly in development mode. Assert takes one expression and checks if it is true or false. If true, the program runs normally; if false, it throws an AssertionError.',
    },
    {
      'question': 'What is Cascade notation in Dart?',
      'answer':
          'Cascades (.., ?..) allow you to make a sequence of operations on the same object. In addition to accessing instance members, you can also call instance methods on that same object.',
    },
    {
      'question': 'What is the spread operator in Dart?',
      'answer':
          'Dart supports the spread operator, which allows inserting multiple elements into a collection.',
    },
    {
      'question': 'What is a mixin? When do we use it?',
      'answer':
          'Mixins are helpful when we want to share behavior across multiple classes that don’t share the same class hierarchy, or when it doesn’t make sense to implement such behavior in a superclass.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:
            const Color(0xFF6A1B9A), // Purple color like the C++ code
        title: Text(
          "Dart Interview Questions",
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
                                    0xFF4A148C), // Dark Purple for question
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    20, // Slightly larger font for questions
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
     ),);
}
}
