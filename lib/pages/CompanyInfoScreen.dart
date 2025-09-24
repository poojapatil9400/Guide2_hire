import 'package:flutter/material.dart';

class CompanyInfoScreen extends StatelessWidget {
  final String companyName;
  final String companyDescription;

  const CompanyInfoScreen({
    Key? key,
    required this.companyName,
    required this.companyDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(companyName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(companyDescription),
      ),
    );
  }
}
