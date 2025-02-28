import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String nic;

  ResultScreen({required this.nic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decoded NIC Information'),
        backgroundColor: Colors.purple, // Purple app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NIC Number: $nic',
              style: TextStyle(fontSize: 20, color: Colors.purple.shade700),
            ),
            SizedBox(height: 20),
            // Add all the decoded results here with purple-themed text
            Text(
              'Date of Birth: 1985-12-05', // Replace with dynamic data
              style: TextStyle(fontSize: 18, color: Colors.purple.shade700),
            ),
            SizedBox(height: 10),
            Text(
              'Weekday: Thursday', // Replace with dynamic data
              style: TextStyle(fontSize: 18, color: Colors.purple.shade700),
            ),
            SizedBox(height: 10),
            Text(
              'Age: 39 years', // Replace with dynamic data
              style: TextStyle(fontSize: 18, color: Colors.purple.shade700),
            ),
            SizedBox(height: 10),
            Text(
              'Gender: Male', // Replace with dynamic data
              style: TextStyle(fontSize: 18, color: Colors.purple.shade700),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Go back to InputScreen
                Navigator.pop(context);
              },
              child: Text('Back to Input'),
            ),
          ],
        ),
      ),
    );
  }
}
