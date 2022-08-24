// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To DO App',
      home: todoapp(),
    ),
  );
}

class todoapp extends StatefulWidget {
  @override
  State<todoapp> createState() => _todoappState();
}

class _todoappState extends State<todoapp> {
  late String value;
  var listtodo = [''];

  addtodo(String item) {
    setState(() {
      listtodo.add(item);
    });
  }

  deletee(int ind) {
    setState(() {
      listtodo.removeAt(ind);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TO DO"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            addtodo(value);
          },
        ),
        body: ListView.builder(
            itemCount: listtodo.length,
            itemBuilder: (context, index) {
              return index == 0
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Add items',
                        ),
                        onChanged: (val) {
                          value = val;
                        },
                      ),
                    )
                  : ListTile(
                      leading: Icon(Icons.check_box_outline_blank),
                      trailing: Icon(Icons.minimize),
                      onLongPress: () {
                        deletee(index);
                      },
                      title: Text(
                        '${listtodo[index]}',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
            }));
  }
}
