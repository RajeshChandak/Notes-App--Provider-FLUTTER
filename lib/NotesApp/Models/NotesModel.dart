
import 'package:wslc_323_provider/NotesApp/Database/DbHelper.dart';

class NotesModel {
  int? id;
  String title;
  String description;
  NotesModel({required this.title, required this.description, this.id});

  factory NotesModel.fromMap(Map<String, dynamic> mapdata) {
    return NotesModel(
        title: mapdata[DbHelper.Note_column_title],
        description: mapdata[DbHelper.Note_column_description],
        id: mapdata[DbHelper.Note_column_id]);
  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.Note_column_title: title,
      DbHelper.Note_column_description: description
    };
  }
}
//
// import 'package:wslc_323_provider/NotesApp/Database/DbHelper.dart';
//
// class NotesModel {
//   int? id;
//   String title;
//   String description;
//   NotesModel({required this.title, required this.description, this.id});
//
//   factory NotesModel.fromMap(Map<String, dynamic> mapdata) {
//     return NotesModel(
//         title: mapdata[DbHelper.Note_columntitle],
//         description: mapdata[DbHelper.Note_columndescription],
//         id: mapdata[DbHelper.Note_columnid]);
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       DbHelper.Note_columntitle: title,
//       DbHelper.Note_columndescription: description
//     };
//   }
// }
