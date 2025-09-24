import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Forum extends StatefulWidget {
  const Forum({super.key});

  @override
  State createState() {
    return _ForumState();
  }
}

class _ForumState extends State {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController hastag = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Home Screen"),
      //   backgroundColor: Colors.blue,
      // ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //For Title//
              const Text(
                "Title",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextField(
                controller: title,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 10,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Type here",
                ),
              ),
              //For Title//

              const SizedBox(
                height: 50,
              ),

              //For Description//
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextField(
                controller: description,         
                       decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 10,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Type here",
                ),
              ),
              //For Hashtags//
              const SizedBox(
                height: 50,
              ),

              //For Hashtags//
              const Text(
                "Hashtags",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextField(
                controller: hastag,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 10,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Type here",
                ),
              ),
              //For Hashtags//

              const SizedBox(
                height: 50,
              ),

              Center(
                child: GestureDetector(
                  onTap: ()async{
                      Map<String ,dynamic>data={
                      "Title":title.text.trim(),
                      "Description":description.text.trim(),
                      "Hashtag":hastag.text.trim(),
                      

                    };
                     await FirebaseFirestore.instance.collection("Forum").add(data);
                     Navigator.pop(context);
                     setState(() {
                       
                     });

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 5, 37, 94),
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueAccent,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    alignment: Alignment.center,
                    child: const Text(
                      "SUBMIT",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
),
);
}
}
