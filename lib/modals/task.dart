class Task {
  final String title;
  bool isChecked = false;

  Task({
    required this.title,
    required this.isChecked,
  });

  void toggleCheck() {
    isChecked = !isChecked;
  }
}
