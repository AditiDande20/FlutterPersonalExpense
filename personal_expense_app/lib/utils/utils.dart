import 'package:intl/intl.dart';

String getDate(String dateTime) {
  String formattedDate = "";
  try {
    DateTime dt = DateTime.parse(dateTime);
    var formatter = DateFormat('MMM dd, yyyy');
    formattedDate = formatter.format(dt);
  } catch (ex) {}
  return formattedDate;
}
