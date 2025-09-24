import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const HtmlCode());
}

class HtmlCode extends StatefulWidget {
  const HtmlCode({super.key});
  @override
  State createState() => _HtmlCodeState();
}

class _HtmlCodeState extends State<HtmlCode> {
  List<Map<String, dynamic>> Codes = [
    {
      'question': 'What is HTML?',
      'answer':
          'HTML stands for Hypertext Markup Language, the language of the Internet. It is the standard text formatting language used for creating and displaying pages on the Internet.HTML documents comprise the elements and the tags that format it for proper page display.',
    },
    {
      'question': 'What are HTML tags?',
      'answer':
          'We use HTML tags to place the elements in the proper and appropriate format. Tags use the symbols < and > to set them apart from the HTML content. The HTML tags need not always be closed. For example, in the case of images, the closing tags are not required as <img> tags.',
    },
    {
      'question': 'What are HTML Attributes?',
      'answer':
          'Attributes are the properties that can be added to an HTML tag. These attributes change the way the tag behaves or is displayed. For example, a <img> tag has an src attribute, which you use to add the source from which the image should be displayed.',
    },
    {
      'question': 'What is a marquee in HTML?',
      'answer':
          'Marquee is used for scrolling text on a web page. It automatically scrolls the image or text up, down, left, or right. You must use </marquee> tags to apply for a marquee.',
    },
    {
      'question': 'How do you separate a section of text in HTML?',
      'answer':
          'We separate a section of text in HTML using the below tags: <br> tag – It separates the line of text. It breaks the current line and shifts the flow of the text to a new line. <p> tag–This tag is used to write a paragraph of text. <blockquote> tag–This tag defines large quoted sections.',
    },
    {
      'question': 'How do you align list elements in an HTML file?',
      'answer':
          'We can align the list elements in an HTML file using indents. If you indent each nested list further than the parent list, you can easily align and determine the various lists and their elements.',
    },
    {
      'question': 'What is an element in HTML?',
      'answer':
          'An element in HTML is a set of tags that define a specific part of a web page. It consists of a start tag, content, and an end tag.',
    },
    {
      'question': 'What is the difference between HTML and CSS?',
      'answer':
          'HTML creates a web pages structure and content, while CSS defines its appearance and layout.',
    },
    {
      'question': 'Are the HTML tags and elements the same thing?',
      'answer':
          'No, HTML tags define the structure of a web page, while HTML elements are made up of a set of tags that define a specific part of a web page.',
    },
    {
      'question': 'What are void elements in HTML?',
      'answer':
          'Void elements in HTML are tags that do not require a closing tag. They are used to insert images, line breaks, and other content that does not require additional information.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A1B9A), // Custom purple color
        title: Text(
          "HTML Interview Questions",
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
