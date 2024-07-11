import 'package:intl/intl.dart';

String formatDate(String date) {
  DateTime parsedDate = DateTime.parse(date);

  String formattedDate = DateFormat('d MMMM yyyy').format(parsedDate);

  return formattedDate;
}

String capitalizeFirstLetter(String input) {

  if (input.isEmpty) return input;
  
  return input[0].toUpperCase() + input.substring(1);
}