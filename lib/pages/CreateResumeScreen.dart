import 'package:flutter/material.dart';

class CreateResumeScreen extends StatelessWidget {
  const CreateResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Resume'),
        backgroundColor: const Color.fromARGB(0, 250, 17, 17),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your details to create a resume!',
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement resume creation logic here
              },
              child: const Text('Start Resume'),
            ),
          ],
        ),
      ),
    );
  }
}
