import "package:flutter/material.dart";

class UserAccessScreen extends StatefulWidget {
  const UserAccessScreen({super.key});

  @override
  State createState() {
    return _UserAccessScreenState();
  }
}

class _UserAccessScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 202, 201, 201),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color.fromARGB(255, 3, 64, 114),
                      width: 5,
                    ),
                  ),
                  child: const Text(
                    "User",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                  width: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 202, 201, 201),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color.fromARGB(255, 3, 64, 114),
                      width: 5,
                    ),
                  ),
                  child: const Text(
                    "Admin",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
     ),
);
}
}
