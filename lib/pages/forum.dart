import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:place_vitaapp/pages/bottomSheet.dart';
import 'package:place_vitaapp/pages/ProfileScreen.dart';

class ForumScreen2 extends StatefulWidget {
  const ForumScreen2({super.key});

  @override
  State createState() => _ForumState();
}

class _ForumState extends State<ForumScreen2> {
  List<Map<String, dynamic>> ForumList = []; // Explicit type declaration
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController hastag = TextEditingController();

  @override
  void initState() {
    super.initState();
    ForumListGetter(); // Load data when the widget is initialized
    _profileDetailsMapGetter();
  }

  void ForumListGetter() async {
    print("hiii");
    try {
      QuerySnapshot response = await FirebaseFirestore.instance.collection('Forum').get();

      // Clear the current list to avoid duplicates
      ForumList.clear();

      
      for (var docSnap in response.docs) {
        Map<String, dynamic> map = {
          "Title": docSnap["Title"] ?? "No Name",
          "Description": docSnap["Description"] ?? "No Comments",
          "Hashtag": docSnap["Hashtag"] ?? "No HashTag",
        };

        ForumList.add(map);
      }

      // Update the UI
      setState(() {});
    } catch (e) {
      print("Error fetching Forum data: $e");
    }
  }
final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _collegeController = TextEditingController();
  final _branchController = TextEditingController();
  final _skillsController = TextEditingController();
  final _experienceController = TextEditingController();
  bool _isLoading = true; // To handle loading state

  String username ="";

 

  @override
  void dispose() {
    // Dispose controllers to release resources
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _collegeController.dispose();
    _branchController.dispose();
    _skillsController.dispose();
    _experienceController.dispose();
    super.dispose();
  }

  // Fetch profile details from Firestore
  Future<void> _profileDetailsMapGetter() async {
    try {
      DocumentSnapshot response = await FirebaseFirestore.instance
          .collection('SignupData')
          .doc(ProfileScreen.email)
          .get();
           //print("hii username"+username);

      if (response.exists) {
        final data = response.data() as Map<String, dynamic>;

        setState(() {
          _nameController.text = data['Name'] ?? '';
          username=_nameController.text.trim();
         
          _branchController.text = data['Branch'] ?? '';
          _collegeController.text = data['College/University'] ?? '';
          _emailController.text = data['Email'] ?? '';
          _experienceController.text = data['Experience'] ?? '';
          _passwordController.text = data['Password'] ?? '';
          _skillsController.text = data['Skills'] ?? '';
          _isLoading = false; // Data has been loaded
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        print("Document does not exist.");
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Error fetching profile details: $e");
}
}

  @override
  Widget build(BuildContext context) {
    ForumListGetter();
    return Scaffold(
      backgroundColor: Colors.grey.shade100, // Light neutral background
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ForumList.isEmpty
                  ? const Center(
                      child: Text(
                        "No forums available.",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: ForumList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Future action for tapping on the card
                          },
                          child: Card(
                            elevation: 12, // Increased elevation for emphasis
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20), // Smooth corners
                            ),
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.purple.shade300,
                                    Colors.blue.shade600,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.shade100.withOpacity(0.5),
                                    blurRadius: 15,
                                    offset: const Offset(0, 8), // Shadow below the card
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${_nameController.text}",
                                          style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor:
                                              Colors.white.withOpacity(0.3),
                                          child: const Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      "${ForumList[index]['Title']}",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white70,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      '${ForumList[index]['Description']}',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white70,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                   
                                    Text(
                                       '${ForumList[index]['Hashtag']}',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white70,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                      Divider(
                                      color: Colors.white.withOpacity(0.4),
                                      thickness: 1,
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Action for like
                                              },
                                              icon: const Icon(
                                                Icons.thumb_up_alt_outlined,
                                                color: Colors.redAccent,
                                                size: 28,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            const Text(
                                              'Like',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Action for comment
                                              },
                                              icon: const Icon(
                                                Icons.comment_outlined,
                                                color: Colors.white,
                                                size: 28,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            const Text(
                                              'Comment',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Action for share
                                              },
                                              icon: const Icon(
                                                Icons.share_outlined,
                                                color: Colors.white,
                                                size: 28,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            const Text(
                                              'Share',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
      floatingActionButton: const BottomSheetClass(
        
      ),
);
}
}
