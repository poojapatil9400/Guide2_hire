import 'package:flutter/material.dart';

class CompanyDetailScreen extends StatelessWidget {
  final String companyName;

  const CompanyDetailScreen({super.key, required this.companyName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(companyName),
      ),
      body: Center(
        child: Text(
          'Details about $companyName',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
