import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'result_screen.dart';
import 'nic_controller.dart';

class InputScreen extends StatelessWidget {
  final TextEditingController nicController = TextEditingController();
  final NICController nicControllerInstance = Get.put(NICController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NIC Decoder'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter NIC Number',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.blue[700],
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nicController,
              decoration: InputDecoration(
                labelText: 'NIC Number',
                hintText: 'Enter NIC number here',
                prefixIcon: Icon(Icons.credit_card, color: Colors.blueAccent),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String nic = nicController.text.trim();
                if (nic.isNotEmpty) {
                  nicControllerInstance.nicNumber.value = nic;
                  nicControllerInstance.decodeNIC();
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
              child: Text('Decode'),
            ),
          ],
        ),
      ),
    );
  }
}
