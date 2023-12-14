String capitalize(String text) {
  return text[0].toUpperCase() + text.substring(1);
}

String getFirstName(String fullName) {
  if (fullName.isEmpty) {
    return fullName;
  }
  List<String> parts = fullName.split(' ');
  return parts.isNotEmpty ? parts[0] : fullName;
}
