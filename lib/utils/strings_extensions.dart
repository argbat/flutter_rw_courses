extension StringExtension on String {
  String capitalize() {
    return '${this[0].toLowerCase()}${substring(1)}';
  }
}
