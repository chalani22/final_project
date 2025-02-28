import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NICController extends GetxController {
  var nicNumber = ''.obs;
  var birthYear = ''.obs;
  var birthDate = ''.obs;
  var gender = ''.obs;
  var age = ''.obs;
  var weekday = ''.obs;
  var nicFormat = ''.obs; // To hold the format (old or new)
  var formatText = ''.obs; // To display format in result

  void decodeNIC() {
    String nic = nicNumber.value.trim();
    if (nic.length == 10) {
      // Old format (9 digits + letter)
      nicFormat.value = "Old Format";
      formatText.value = "This is an Old NIC format";
      birthYear.value = "19${nic.substring(0, 2)}"; // First 2 digits for year
      int days = int.parse(nic.substring(2, 5)); // Days of the year
      gender.value = days < 500 ? "Male" : "Female"; // Gender logic
      days = days < 500 ? days : days - 500;
      calculateDate(days - 1); // Fix the birth date offset
    } else if (nic.length == 12) {
      // New format (12 digits)
      nicFormat.value = "New Format";
      formatText.value = "This is a New NIC format";
      birthYear.value = nic.substring(0, 4); // First 4 digits for year
      int days = int.parse(nic.substring(4, 7)); // Days of the year
      gender.value = days < 500 ? "Male" : "Female"; // Gender logic
      days = days < 500 ? days : days - 500;
      calculateDate(days - 1); // Fix the birth date offset
    }
  }

  void calculateDate(int dayOfYear) {
    DateTime dob = DateTime(int.parse(birthYear.value), 1, 1)
        .add(Duration(days: dayOfYear - 1));

    birthDate.value = DateFormat("yyyy-MM-dd").format(dob);
    weekday.value = DateFormat("EEEE").format(dob);

    // Get the current date
    DateTime today = DateTime.now();

    // Calculate age based on full birth date
    int calculatedAge = today.year - dob.year;
    if (today.month < dob.month ||
        (today.month == dob.month && today.day < dob.day)) {
      calculatedAge--; // Adjust age if birthday hasn't passed yet this year
    }

    age.value = calculatedAge.toString();
  }
}
