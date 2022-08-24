class Task {
  final String tasks;
  bool isdone;
  Task({required this.tasks, this.isdone = false});
  void toggledone() {
    isdone = !isdone;
  }
}
