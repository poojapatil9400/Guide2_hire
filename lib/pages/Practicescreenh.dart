import "package:flutter/material.dart";
import "package:place_vitaapp/Quiz/Quizscreen.dart";
import "package:place_vitaapp/codes/Dart.dart";
import "package:place_vitaapp/codes/Html.dart";
import "package:place_vitaapp/codes/JavaScriptcode.dart";
import "package:place_vitaapp/codes/JavaCode.dart";
import "package:place_vitaapp/pages/HomeScreen.dart";
import 'package:google_fonts/google_fonts.dart';
import "package:place_vitaapp/codes/Cpluscode.dart";
import "package:place_vitaapp/codes/fluttercode.dart";

void main() {
  runApp(const Practicescreenh());
}

class Practicescreenh extends StatefulWidget {
  const Practicescreenh({super.key});
  @override
  State createState() => _PracticescreenhState();
}

class _PracticescreenhState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  },
                  child: const Icon(Icons.arrow_back_ios_new)),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: 80,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.purple.shade500, // Purple border color
                width: 2.0, // Border thickness
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  offset: const Offset(6, 6),
                  blurRadius: 10,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-6, -6),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.grey.shade400, // Faint border color
                        width: 1.0, // Thin border width
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade500,
                          offset: const Offset(6, 6),
                          blurRadius: 10,
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-6, -6),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const Text("Questions",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 99, 16, 232),
                        )),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuizScreen(),
                          ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey.shade400, // Faint border color
                          width: 1.0, // Thin border width
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500,
                            offset: const Offset(6, 6),
                            blurRadius: 10,
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-6, -6),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: const Text("Quiz",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 99, 16, 232))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Fluttercode(),
                                    ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: const Offset(6, 6),
                                      blurRadius: 10,
                                    ),
                                    const BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-6, -6),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Image.asset("assets/flutter.png"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Flutter",
                              style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Cpluscode(),
                                    ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: const Offset(6, 6),
                                      blurRadius: 10,
                                    ),
                                    const BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-6, -6),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Image.asset("assets/c++.png"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "C++",
                              style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DartCode(),
                                    ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: const Offset(6, 6),
                                      blurRadius: 10,
                                    ),
                                    const BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-6, -6),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Image.asset("assets/dart.png"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Dart",
                              style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HtmlCode(),
                                    ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: const Offset(6, 6),
                                      blurRadius: 10,
                                    ),
                                    const BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-6, -6),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Image.asset("assets/html-5.png"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Html",
                              style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const JavaScriptcode(),
                                    ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: const Offset(6, 6),
                                      blurRadius: 10,
                                    ),
                                    const BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-6, -6),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Image.asset("assets/javascript.png"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Javascript",
                              style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const JavaCode(),
                                    ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: const Offset(6, 6),
                                      blurRadius: 10,
                                    ),
                                    const BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-6, -6),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Image.asset("assets/java.png"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Java",
                              style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              }),
        )
      ]),
    );
  }
}
