import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbAppConnection {
  
  /// Singleton (private constructor )
  DbAppConnection._();

  /// accessing the connection class object and create db class object
  static final DbAppConnection db = DbAppConnection._();

  /// all db logic

  Database? myDb;

  Future<Database> getDB() async {
    if (myDb != null) {
      return myDb!;
    } else {
     myDb = await initDb();
     return myDb!;
    }
  }

  
  Future<Database> initDb() async {
    var rootPath = await getApplicationDocumentsDirectory();
    var actualPath = join(rootPath.path, 'todo_db.db');

    /// db create
    return await openDatabase( actualPath, version: 1, onCreate: (db, version) async {

      /// create table
      await db.execute('CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT, todo_title TEXT, todo_desc TEXT )');
        
      },
    );
  }
  

  /// insert data
  Future addTodo({required String title,required String desc}) async{
    var db = await getDB();
    
    db.insert('todo', {
      'todo_title': title,
      'todo_desc': desc
    });
    
  }

  /// fetch data
  Future<List<Map<String, dynamic>>> fetchAllTodo()async{
    
    var db = await getDB();
    var data = await db.query('todo');
    return data;
    
    

  }
}
