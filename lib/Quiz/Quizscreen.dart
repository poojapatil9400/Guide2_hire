import 'package:flutter/material.dart';
import 'package:place_vitaapp/pages/Practicescreenh.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int? selectedOption1;
  int selectedOption = -1;
  bool questionScreen = true;
  int score = 0;
  int attemptedQuestions = 0;
  bool showFloatingActionButton = false;

  List<Map> allQuestions = [
    {
      "question": "What is the output of print(2 + 2 * 3) in Dart?",
      "options": ["6", "12", "8", "10"],
      "correctOption": 2,
    },
    {
      "question": "Which data type is used to declare a variable in Dart?",
      "options": ["int", "varable", "let", "const"],
      "correctOption": 0,
    },
    {
      "question": "What does the async keyword indicate in Dart?",
      "options": [
        "The function returns an integer",
        "The function is asynchronous",
        "The function must return null",
        "The function is synchronous"
      ],
      "correctOption": 0,
    },
    {
      "question":
          "Which of the following is used to handle exceptions in Dart?",
      "options": ["catch", "throw", "try-catch", "finally"],
      "correctOption": 1,
    },
    {
      "question": "In Dart, which keyword is used to define a constant value?",
      "options": ["var", "const", "final", "let"],
      "correctOption": 1,
    },
    {
      "question":
          "Which of the following is a valid way to create a list in Dart?",
      "options": [
        "List<int> myList = [1, 2, 3];",
        "var myList = list(1, 2, 3);",
        "int myList[] = {1, 2, 3};",
        "new List myList = [1, 2, 3];"
      ],
      "correctOption": 0,
    },
    {
      "question": "How do you create a new instance of a class in Dart?",
      "options": [
        "var obj = MyClass();",
        "MyClass obj = new MyClass();",
        "new obj = MyClass();",
        "obj = new MyClass();"
      ],
      "correctOption": 1,
    },
    {
      "question": "What does the ?? operator do in Dart?",
      "options": [
        "It checks for null and assigns a default value",
        "It is used to create a list",
        "It is a logical AND operator",
        "It compares two integers"
      ],
      "correctOption": 0,
    },
    {
      "question": "Which method is used to print output in Dart?",
      "options": ["output()", "print()", "echo()", "display()"],
      "correctOption": 1,
    },
    {
      "question":
          "Which of the following is used to define a constructor in Dart?",
      "options": [
        "className()",
        "void className()",
        "def className()",
        "class className()"
      ],
      "correctOption": 0,
    }
  ];

  List<Map> javaquestions = [
    {
      "question": "Who invented Java Programming?",
      "options": [
        "Guido van Rossum",
        "James Gosling",
        "Dennis Ritchie",
        "Bjarne Stroustrup"
      ],
      "correctOption": 1,
    },
    {
      "question": "Which statement is true about Java?",
      "options": [
        "Java is a sequence-dependent programming language",
        "Java is a code dependent programming language",
        "Java is a platform-dependent programming language",
        "Java is a platform-independent programming language"
      ],
      "correctOption": 3,
    },
    {
      "question":
          "Which component is used to compile, debug and execute the java programs?",
      "options": ["JRE", "JIT", "JDK", "JVM"],
      "correctOption": 2,
    },
    {
      "question": "Which one of the following is not a Java feature?",
      "options": [
        "Object-oriented",
        "Use of pointers",
        "Portable",
        "Dynamic and Extensible"
      ],
      "correctOption": 1,
    },
    {
      "question": " Which of these cannot be used for a variable name in Java?",
      "options": [
        "identifier & keyword",
        "identifier",
        "keyword",
        "none of the mentioned"
      ],
      "correctOption": 2,
    },
  ];

  List<Map> DartQuestion = [
    {
      "question": "Which one of the following is not a Java feature?",
      "options": [
        "Object-oriented",
        "Use of pointers",
        "Portable",
        "Dynamic and Extensible"
      ],
      "correctOption": 1,
    },];
  List<Map> CQuestions = [
    {
      "question": "Who is the father of C language?",
      "options": [
        "Steve Jobs",
        " James Gosling",
        "Dennis Ritchie",
        " Rasmus Lerdorf"
      ],
      "correctOption": 2,
    },
    {
      "question": "Which of the following is not a valid C variable name?",
      "options": [
        "int number",
        "float rate",
        "int variable_count",
        "int %name"
      ],
      "correctOption": 3,
    },
    {
      "question": "Which of the following cannot be a variable name in C?",
      "options": ["volatile", "true", "friend", "export"],
      "correctOption": 0,
    },
    {
      "question": "What is short int in C programming?",
      "options": [
        "The basic data type of C",
        "Qualifier",
        "Short is the qualifier and int is the basic data type",
        " All of the mentioned"
      ],
      "correctOption": 2,
    },
    {
      "question": "What is an example of iteration in C?",
      "options": ["for", "While", " do-while", "all of the mentioned"],
      "correctOption": 3,
    },
  ];

  List<Map> Htmlquestions = [
    {
      "question": " HTML stands for -",
      "options": [
        "HighText Machine Language",
        "HyperText and links Markup Language",
        "HyperText Markup Language",
        "None of these"],
      "correctOption": 2,
    },
    {
      "question":
          " Which of the following element is responsible for making the text bold in HTML?",
      "options": ["<pre>", "<a>", "<b>", "<br>"],
      "correctOption": 2,
    },
    {
      "question":
          "Which of the following tag is used for inserting the largest heading in HTML?",
      "options": ["<h3>", "<h1>", "<h5>", "<h6>"],
      "correctOption": 1,
    },
    {
      "question":
          "Which of the following tag is used to make the underlined text?",
      "options": ["<i>", "<ul>", "<u>", "<pre>"],
      "correctOption": 2,
    },
    {
      "question":
          "Which of the following tag is used to define options in a drop-down selection list?",
      "options": ["<select>", "<list>", "<dropdown>", "<option>"],
      "correctOption": 3,
    },
  ];

  List<Map> Flutterquestions = [
    {
      "question":
          "Who developed the Flutter Framework and continues to maintain it today?",
      "options": [" Facebook", "Microsoft", " Google", "Oracle"],
      "correctOption": 2,
    },
    {
      "question":
          "Which programming language is used to build Flutter applications?",
      "options": [" Kotlin", "Dart", "Java", "Go"],
      "correctOption": 1,
    },
    {
      "question": "How many types of widgets are there in Flutter?",
      "options": ["2", "4", "6", "8+"],
      "correctOption": 0,
    },
    {
      "question": "A sequence of asynchronous Flutter events is known as a:",
      "options": ["Flow", "Current", "Stream", "Series"],
      "correctOption": 2,
    },
    {
      "question":
          "What type of test can examine your code as a complete system?",
      "options": [
        "Unit tests",
        "Widget tests",
        "Integration Tests",
        "All of the above"
      ],
      "correctOption": 2,
    },
  ];

  List<int> selectedOptions = [];

  List<bool> scoreUpdate = [];
  bool Cflag = false;
  bool Cplusflag = false;
  bool javaflag = false;
  bool Javascriptflag = false;
  bool Flutterflag = false;
  bool Dartflag = false;
  bool Htmlflag = false;
  int itemCountgenerator() {
    if (Dartflag) {
      return allQuestions.length;
    } else if (Cflag) {
      return CQuestions.length;
    } else if (javaflag) {
      return javaquestions.length;
    } else if (Htmlflag) {
      return Htmlquestions.length;
    } else if (Flutterflag) {
      return Flutterquestions.length;
    } else {
      return 0;
    }
  }

  void updateScore(int questionIndex, int selectedOption,List list) {
    if (!scoreUpdate[questionIndex] &&
        selectedOption == list[questionIndex]["correctOption"]) {
      score++;
      scoreUpdate[questionIndex] = true;
    }
  }

  WidgetStatePropertyAll<Color? > checkAnswer(
      int answerIndex, int questionIndex,List list) {
        print("check");
    if (selectedOptions[questionIndex] != -1) {
      if (answerIndex == list[questionIndex]["correctOption"]) {
        return WidgetStatePropertyAll(Colors.green);
      } else if (selectedOptions[questionIndex] == answerIndex) {
        return WidgetStatePropertyAll(Colors.red);
      } else {
        return WidgetStatePropertyAll(null);
      }
    } else {
      return const WidgetStatePropertyAll(null);
    }
  }
  

  Widget questionOptionCard(int index, List list) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Container(
         decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.blueAccent, width: 3),
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3),
      ),
    ],),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                Expanded(
                  child: Text(
                    "${index + 1}. ${list[index]["question"]}",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            for (int i = 0; i < list[index]["options"].length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    onPressed: () {
                      if(Dartflag){
                        print("Dart flag is true");
                         if (selectedOptions[index] == -1) {
                        selectedOptions[index] = i;
                        
                        updateScore(index, i,allQuestions);
                        attemptedQuestions++;

                        if (attemptedQuestions == allQuestions.length) {
                          questionScreen = false;
                        }
                   
                   
                        setState(() {
                          
                        });

                      
                        
                      }
                      
                      }if(javaflag){
                        print("java flag is true");
                      }
                     
                    },
                  
                  style: ButtonStyle(
    backgroundColor: checkAnswer(i, index, allQuestions),
  ),
                    child: Text(
                      list[index]["options"][i],
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (selectedOptions.length == 0) {
      for (int i = 0; i < allQuestions.length; i++) {
        selectedOptions.add(-1);
      }
    }
    if (scoreUpdate.length == 0) {
      for (int i = 0; i < allQuestions.length; i++) {
        scoreUpdate.add(false);
      }
    }
    if (questionScreen) {
      return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
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
                  offset: Offset(6, 6),
                  blurRadius: 10,
                ),
                BoxShadow(
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
                            GestureDetector(
                               onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Practicescreenh(),
                          ));},
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
                              offset: Offset(6, 6),
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
                                     color: Color.fromARGB(255, 99, 16, 232)
                                    )),
                              ),
                            ),
                            const SizedBox(width: 20),
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
                            offset: Offset(6, 6),
                            blurRadius: 10,
                          ),
                          BoxShadow(
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              javaflag = false;
                              Cflag = true;
                              Cplusflag = false;
                              Javascriptflag = false;
                              Flutterflag = false;
                              Dartflag = false;
                              Htmlflag = false;
                              setState(() {});
                            },
                            child:Container(
  alignment: Alignment.center,
  height: 50,
  width: 130,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: LinearGradient(
      colors: [Colors.purple.shade300, Colors.purple.shade700],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.purple.shade900.withOpacity(0.4),
        offset: Offset(4, 4),
        blurRadius: 8,
      ),
      BoxShadow(
        color: Colors.white.withOpacity(0.8),
        offset: Offset(-4, -4),
        blurRadius: 8,
      ),
    ],
    border: Border.all(
      color: Colors.purple.shade800,
      width: 3,
    ),
  ),
  child: const Text(
    "C",
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      shadows: [
        Shadow(
          blurRadius: 5,
          color: Colors.black26,
          offset: Offset(2, 2),
        ),
      ],
    ),
  ),
),


                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              javaflag = false;
                              Cflag = false;
                              Cplusflag = false;
                              Javascriptflag = false;
                              Flutterflag = false;
                              Dartflag = false;
                              Htmlflag = true;
                              selectedOptions.clear();
                              setState(() {});
                            },
                            child: Container(
  alignment: Alignment.center,
  height: 50,
  width: 130,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: LinearGradient(
      colors: [Colors.purple.shade300, Colors.purple.shade700],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.purple.shade900.withOpacity(0.4),
        offset: Offset(4, 4),
        blurRadius: 8,
      ),
      BoxShadow(
        color: Colors.white.withOpacity(0.8),
        offset: Offset(-4, -4),
        blurRadius: 8,
      ),
    ],
    border: Border.all(
      color: Colors.purple.shade800,
      width: 3,
    ),
  ),
  child: const Text(
    "Html",
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      shadows: [
        Shadow(
          blurRadius: 5,
          color: Colors.black26,
          offset: Offset(2, 2),
        ),
      ],
    ),
  ),
),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              javaflag = false;
                              Cflag = false;
                              Cplusflag = false;
                              Javascriptflag = false;
                              Flutterflag = true;
                              Dartflag = false;
                              Htmlflag = false;
                              setState(() {});
                            },
                            child: Container(
  alignment: Alignment.center,
  height: 50,
  width: 130,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: LinearGradient(
      colors: [Colors.purple.shade300, Colors.purple.shade700],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.purple.shade900.withOpacity(0.4),
        offset: Offset(4, 4),
        blurRadius: 8,
      ),
      BoxShadow(
        color: Colors.white.withOpacity(0.8),
        offset: Offset(-4, -4),
        blurRadius: 8,
      ),
    ],
    border: Border.all(
      color: Colors.purple.shade800,
      width: 3,
    ),
  ),
  child: const Text(
    "Flutter",
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      shadows: [
        Shadow(
          blurRadius: 5,
          color: Colors.black26,
          offset: Offset(2, 2),
        ),
      ],
    ),
  ),
),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              javaflag = true;
                              Cflag = false;
                              Cplusflag = false;
                              Javascriptflag = false;
                              Flutterflag = false;
                              Dartflag = false;
                              Htmlflag = false;
                               selectedOptions.clear();
                              setState(() {});
                            },
                            child: Container(
  alignment: Alignment.center,
  height: 50,
  width: 130,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: LinearGradient(
      colors: [Colors.purple.shade300, Colors.purple.shade700],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.purple.shade900.withOpacity(0.4),
        offset: Offset(4, 4),
        blurRadius: 8,
      ),
      BoxShadow(
        color: Colors.white.withOpacity(0.8),
        offset: Offset(-4, -4),
        blurRadius: 8,
      ),
    ],
    border: Border.all(
      color: Colors.purple.shade800,
      width: 3,
    ),
  ),
  child: const Text(
    "Java",
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      shadows: [
        Shadow(
          blurRadius: 5,
          color: Colors.black26,
          offset: Offset(2, 2),
        ),
      ],
    ),
  ),
),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              javaflag = false;
                              Cflag = false;
                              Cplusflag = false;
                              Javascriptflag = false;
                              Flutterflag = false;
                              Dartflag = true;
                              Htmlflag = false;
                               selectedOptions.clear();
                              setState(() {});
                            },
                            child: Container(
  alignment: Alignment.center,
  height: 50,
  width: 130,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: LinearGradient(
      colors: [Colors.purple.shade300, Colors.purple.shade700],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.purple.shade900.withOpacity(0.4),
        offset: Offset(4, 4),
        blurRadius: 8,
      ),
      BoxShadow(
        color: Colors.white.withOpacity(0.8),
        offset: Offset(-4, -4),
        blurRadius: 8,
      ),
    ],
    border: Border.all(
      color: Colors.purple.shade800,
      width: 3,
    ),
  ),
  child: const Text(
    "Dart",
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      shadows: [
        Shadow(
          blurRadius: 5,
          color: Colors.black26,
          offset: Offset(2, 2),
        ),
      ],
    ),
  ),
),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
                Text(
                  "Score: $score/${allQuestions.length}",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemCountgenerator(),
                itemBuilder: (BuildContext context, int index) {
                  if (Dartflag) {
                    return questionOptionCard(index, allQuestions);
                  } else if (javaflag) {
                    return questionOptionCard(index, javaquestions);
                  } else if (Flutterflag) {
                    return questionOptionCard(index, Flutterquestions);
                  } else if (Cflag) {
                    return questionOptionCard(index, CQuestions);
                  }else if (Htmlflag) {
                    return questionOptionCard(index, Htmlquestions);
                  } else {
                    null;
                  }
                },
              ),
            )
          ],
        ),
      );
    } else {
      return resultScreen();
    }
  }

  Scaffold resultScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Result",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor:Colors.purple.shade500, 
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 80,
          ),
          Image.network(
              "https://th.bing.com/th?id=OIP.QTYWJcxE3wf4GmIOrHZkaAHaJk&w=219&h=284&c=8&rs=1&qlt=90&r=0&o=6&dpr=1.3&pid=3.1&rm=2"),
          SizedBox(
            height: 100,
          ),
          Text(
            "Score : $score / ${allQuestions.length}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              questionScreen = true;
              scoreUpdate.clear();
              selectedOptions.clear();
              score = 0;
              attemptedQuestions = 0;
              setState(() {});
            },
            child: Container(
  alignment: Alignment.center,
  height: 50,
  width: 200,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: LinearGradient(
      colors: [Colors.purple.shade300, Colors.purple.shade700],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.purple.shade900.withOpacity(0.4),
        offset: Offset(4, 4),
        blurRadius: 8,
      ),
      BoxShadow(
        color: Colors.white.withOpacity(0.8),
        offset: Offset(-4, -4),
        blurRadius: 8,
      ),
    ],
    border: Border.all(
      color: Colors.purple.shade800,
      width: 3,
    ),
  ),
  child: const Text(
    "Restart",
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      shadows: [
        Shadow(
          blurRadius: 5,
          color: Colors.black26,
          offset: Offset(2, 2),
        ),
      ],
    ),
  ),
),
          ),
          SizedBox(height: 10,),
          GestureDetector(
            onTap: (){
               Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const QuizScreen(),
                                    ));
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [Colors.purple.shade300, Colors.purple.shade700],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.shade900.withOpacity(0.4),
                    offset: Offset(4, 4),
                    blurRadius: 8,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.8),
                    offset: Offset(-4, -4),
                    blurRadius: 8,
                  ),
                ],
                border: Border.all(
                  color: Colors.purple.shade800,
                  width: 3,
                ),
              ),
              child: const Text(
                "Back",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  shadows: [
                    Shadow(
            blurRadius: 5,
            color: Colors.black26,
            offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
