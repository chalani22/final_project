import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'nic_controller.dart';

class ResultScreen extends StatelessWidget {
  final String nic;
  final NICController nicController = Get.put(NICController());

  ResultScreen({required this.nic}) {
    nicController.nicNumber.value = nic;
    nicController.decodeNIC();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decoded NIC Information'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NIC Number: $nic',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'NIC Format: ${nicController.nicFormat.value}', // ADDED
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Date of Birth: ${nicController.birthDate.value}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Weekday: ${nicController.weekday.value}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Age: ${nicController.age.value} years',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                'Gender: ${nicController.gender.value}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Back to Input'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
