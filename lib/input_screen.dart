import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_project/result_screen.dart';

class InputScreen extends StatelessWidget {
  final TextEditingController nicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NIC Decoder'),
        backgroundColor: Color.fromARGB(255, 98, 220, 208), // Teal app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Enter NIC Number',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 105, 98), // Dark teal text
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nicController,
              decoration: InputDecoration(
                labelText: 'NIC Number',
                hintText: 'Enter NIC number here',
                prefixIcon: Icon(Icons.credit_card,
                    color: Color.fromARGB(255, 98, 220, 208)), // Teal icon
                filled: true,
                fillColor:
                    Color.fromARGB(50, 98, 220, 208), // Light teal background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String nic = nicController.text.trim();
                if (nic.isNotEmpty) {
                  // Decode NIC and navigate to Result Screen
                  Get.to(() => ResultScreen(nic: nic));
                } else {
                  Get.snackbar(
                    'Error',
                    'Please enter a NIC number.',
                    backgroundColor: Colors.red.shade200,
                    colorText: Colors.white,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color.fromARGB(255, 98, 220, 208), // Teal button
                foregroundColor: Colors.white, // White text
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Decode'),
            ),
          ],
        ),
      ),
    );
  }
}
