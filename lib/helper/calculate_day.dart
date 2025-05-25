class CalculateDay {
  static String getDayDifference(DateTime? endDate) {
    if (endDate == null) {
      endDate = DateTime.now();
    }

    final startDate = DateTime.now();
    final startOnly = DateTime(startDate.year, startDate.month, startDate.day);
    final endOnly = DateTime(endDate.year, endDate.month, endDate.day);

    final difference = endOnly.difference(startOnly).inDays;
    return difference.toString();
  }
}
