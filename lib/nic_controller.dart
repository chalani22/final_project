import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NICController extends GetxController {
  var nicNumber = ''.obs;
  var birthYear = ''.obs;
  var birthDate = ''.obs;
  var gender = ''.obs;
  var age = ''.obs;
  var weekday = ''.obs;
  var nicFormat = ''.obs;

  void decodeNIC() {
    String nic = nicNumber.value.trim();
    if (nic.length == 10) {
      nicFormat.value = "Old Format";
      birthYear.value = "19${nic.substring(0, 2)}";
      int days = int.parse(nic.substring(2, 5));
      gender.value = days < 500 ? "Male" : "Female";
      days = days < 500 ? days : days - 500;
      calculateDate(days);
    } else if (nic.length == 12) {
      nicFormat.value = "New Format";
      birthYear.value = nic.substring(0, 4);
      int days = int.parse(nic.substring(4, 7));
      gender.value = days < 500 ? "Male" : "Female";
      days = days < 500 ? days : days - 500;
      calculateDate(days);
    }
  }

  void calculateDate(int dayOfYear) {
    DateTime dob = DateTime(int.parse(birthYear.value), 1, 1)
        .add(Duration(days: dayOfYear - 1));
    birthDate.value = DateFormat("yyyy-MM-dd").format(dob);
    weekday.value = DateFormat("EEEE").format(dob);
    age.value = (DateTime.now().year - dob.year).toString();
  }
}
