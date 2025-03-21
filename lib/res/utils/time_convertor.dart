import 'package:intl/intl.dart';

String formatTime24hr(String dateTimeStr) {
  try {
    DateTime dateTime = DateTime.parse(dateTimeStr); // Parse the string into DateTime
    return DateFormat('HH:mm').format(dateTime); // Format to 24-hour time
  }catch (e) {
    print("Error formatting time: $e");
    return dateTimeStr; // Return original time if parsing fails
  }
}

// Function to format 24-hour time to 12-hour format with AM/PM
String formatTime12hr(String time24hr) {
  try {
    // Parse the time in 24-hour format
    DateTime time = DateFormat("HH:mm").parse(time24hr);

    // Format it to 12-hour format with AM/PM
    return DateFormat("h:mm a").format(time);
  } catch (e) {
    print("Error formatting time: $e");
    return time24hr; // Return original time if parsing fails
  }
}


String formatDate(DateTime date) {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  return formatter.format(date); // returns date in "dd-MM-yyyy" format
}