import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Cpluscode());
}

class Cpluscode extends StatefulWidget {
  const Cpluscode({super.key});

  @override
  State createState() => _CpluscodeeState();
}

class _CpluscodeeState extends State<Cpluscode> {
  List<Map<String, dynamic>> Codes = [
    {
      'question': 'What are classes and objects in C++?',
      'answer':
          'A class is like a blueprint of an object. It is a user-defined data type with data members and member functions and is defined with the keyword class. You define objects as an instance of a class. Once it creates the object, it can operate on both data members and member functions.',
    },
    {
      'question': 'What are access modifiers?',
      'answer':
          'You use access modifiers to define accessibility for the class members. It defines how to access the members of the class outside the class scope. There are three types of access modifiers: Private, Public, and Protected.',
    },
    {
      'question':
          'Difference between equal to (==) and assignment operator(=)?',
      'answer':
          'The equal to operator (==) checks whether two values are equal or not. If equal, it’s true; otherwise, it will return false. The assignment operator (=) assigns the value of the right-side expression to the left operand.',
    },
    {
      'question': 'What is the size of the int data type?',
      'answer': '1 - 4 bytes, the integer data type is 4 bytes.',
    },
    {
      'question': 'Which among the following operators cannot be overloaded?',
      'answer':
          'The ? : operator cannot be overloaded because it is not syntactically possible.',
    },
    {
      'question':
          'What is used to return the number of characters in the string?',
      'answer':
          'Both size and length are used to return the number of characters in the string.',
    },
    {
      'question': 'Discuss the difference between prefix and postfix?',
      'answer':
          'In prefix (++i), it first increments the value and then assigns the value to the expression. In postfix (i++), it assigns the value to the expression and then increments the variable’s value.',
    },
    {
      'question': 'Can you compile a program without the main function?',
      'answer':
          'Yes, you can compile a program without the main function, but you cannot run or execute the program because the main() function is the entry point, from where all the execution begins.',
    },
    {
      'question': 'What is a virtual function?',
      'answer':
          'A member function in the base class redefined in a derived class is a virtual function. It is declared using the virtual keyword. It ensures that the correct function is called for an object, irrespective of the type of reference/pointer used for the function call. Virtual functions are mainly used for runtime polymorphism.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A1B9A), // Custom purple color
        title: Text(
          "C++ Interview Questions",
          style: GoogleFonts.quicksand(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        elevation: 5,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
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
                                    0xFF4A148C), // Dark purple for question
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
     ),
);}
}
