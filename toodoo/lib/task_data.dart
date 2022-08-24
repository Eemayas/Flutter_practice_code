import 'package:flutter/foundation.dart';
import 'dart:collection';

import 'model/task.dart';
import 'taskwindow.dart';

class taskdata extends ChangeNotifier {
  List<Task> _taskss = [
    Task(tasks: 'Buy milk'),
    Task(tasks: 'egg'),
    Task(tasks: 'fruits'),
  ];
  int get llength {
    return _taskss.length;
  }

  void addtassk(String newtasktitle) {
    final task = Task(tasks: newtasktitle);
    _taskss.add(task);
    notifyListeners();
  }

  UnmodifiableListView<Task> get taskss {
    return UnmodifiableListView(_taskss);
  }

  void updatetsa(Task task) {
    task.toggledone();
    notifyListeners();
  }

  void deltetask(Task task) {
    _taskss.remove(task);
    notifyListeners();
  }
}
