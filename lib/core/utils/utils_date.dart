extension FormatDateTime on DateTime {
  String toDate() {
    return '$day/$month/$year';
  }

  String toDateTime() {
    return '${toDate()} $hour:$minute';
  }
}
