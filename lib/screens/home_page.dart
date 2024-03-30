import 'package:flutter/material.dart';
import 'package:todo_sqlite/db_connections/connection.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DbAppConnection? db;

  
  @override
  void initState() {
    var db = DbAppConnection.db; // accessing the database class object
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    
    
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Sqlite'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListView();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          db!.addTodo();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
