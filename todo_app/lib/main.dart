import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "TODO APP",
        home: TODOAPP(),
      ),
    );

class TODOAPP extends StatefulWidget {
  const TODOAPP({Key? key}) : super(key: key);

  @override
  State<TODOAPP> createState() => _TODOAPPState();
}

class _TODOAPPState extends State<TODOAPP> {
  String value = "";
  

  var listTodo = [
    '',
  ];
  addToDo(String item) {
    setState(() {
      listTodo.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO APP"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          addToDo(value);
        },
      ),
      body: ListView.builder(
          itemCount: listTodo.length,
          itemBuilder: (context, index) {
            return index == 0
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "ADD ITEM"),
                      onChanged: (val) {
                        value = val;
                      },
                    ),
                  )
                : ListTile(
                    leading: Icon(Icons.info),
                    title: Text(
                      '${listTodo[index]}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  );
          }),
    );
  }
}
