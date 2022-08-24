// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import '../task_data.dart';
import 'listtile.dart';
import 'package:toodoo/model/task.dart';
import 'package:provider/provider.dart';

class listview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<taskdata>(
      builder: (BuildContext context, value, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final taskshort = value.taskss[index];
            return listtile(
                list: taskshort.tasks,
                ischecked: taskshort.isdone,
                lonpress: () {
                  value.deltetask(taskshort);
                },
                callbackfunction: (bool? valuue) {
                  value.updatetsa(taskshort);
                });
          },
          itemCount: value.llength,
        );
      },
    );
  }
}
