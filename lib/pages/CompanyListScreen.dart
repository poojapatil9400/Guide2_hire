// company_list_screen.dart

import 'package:flutter/material.dart';

class CompanyListScreen extends StatelessWidget {
  const CompanyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> companies = ['TCS', 'Infosys', 'Cognizant', 'Accenture', 'Wipro'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Companies'),
      ),
      body: ListView.builder(
        itemCount: companies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(companies[index]),
            onTap: () {
              // Navigate or perform actions when a company is tapped
            },
          );
        },
      ),
    );
  }
}
