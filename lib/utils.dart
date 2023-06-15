String formatDate(String dbDate) {
  return DateTime.fromMillisecondsSinceEpoch(int.tryParse(dbDate) ?? 0).toString();
}