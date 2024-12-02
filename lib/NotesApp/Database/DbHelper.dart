import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wslc_323_provider/NotesApp/Models/NotesModel.dart';

class DbHelper {
  static final DbHelper db = DbHelper(); //Singleton Class
  Database? _database; //private variable of Database
  static const Note_table = "note_table";
  static const Note_column_id = "note_id";
  static const Note_column_title = "note_title";
  static const Note_column_description = "note_description";

    Future<Database> getDb() async {
    if (_database != null) {
      return _database!;
    } else {
      return await initDb();
    }
  }

    Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    var dbpath = join(directory.path, "notesdb.db");
    return openDatabase(dbpath, version: 1, onCreate: (db, version) {
      db.execute(
          " create table $Note_table( $Note_column_id integer primary key autoincrement, $Note_column_title text, $Note_column_description text ) ");
    });
  }

  Future<bool> addNotes(NotesModel nm) async {
    var db = await getDb();
    int rowsEffect = await db.insert(Note_table, nm.toMap());
    return rowsEffect > 0;
  }

  Future<List<NotesModel>> fetchNotes() async {
    var db = await getDb();
    List<NotesModel> emptyList = [];
    List<Map<String, dynamic>> notes = await db.query(Note_table);

    for (Map<String, dynamic> allNotes in notes) {
      NotesModel getNotes = NotesModel.fromMap(allNotes);
      emptyList.add(getNotes);
    }
    return emptyList;
  }
}
//
// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:wslc_323_provider/NotesApp/Models/NotesModel.dart';
//
// class DbHelper {
//   static final DbHelper db = DbHelper(); //Singleton class
//   Database? _database; // _xyz means Private Variable
//   static const Note_table = "notes_table";
//   static const Note_columnid = "note_id";
//   static const Note_columntitle = "note_title";
//   static const Note_columndescription = "notes_desc";
//
//   Future<Database> getDb() async {
//     if (_database != null) {
//       return _database!;
//     } else {
//       return await initDb();
//     }
//   }
//
//   Future<Database> initDb() async {
//     Directory directory = await getApplicationDocumentsDirectory();
//     var dbpath = join(directory.path, "notesdb.db");
//     return openDatabase(dbpath, version: 1, onCreate: (db, version) {
//       db.execute(
//           " create table $Note_table( $Note_columnid integer primary key autoincrement, $Note_columntitle text, $Note_columndescription text ) ");
//     });
//   }
//
//   Future<bool> addData(NotesModel nm) async {
//     var db = await getDb();
//     int rowseffect = await db.insert(Note_table, nm.toMap());
//     return rowseffect > 0;
//   }
//
//   Future<List<NotesModel>>fetchNotes()async{
//     var db=await getDb();
//     List<NotesModel>emptyList = [];
//     List<Map<String, dynamic>>notes = await db.query(Note_table);
//
//     for(Map<String,dynamic>allNotes in notes){
//       NotesModel getNotes = NotesModel.fromMap(allNotes);
//       emptyList.add(getNotes);
//     }
//     return emptyList;
//   }
//
//
// }
