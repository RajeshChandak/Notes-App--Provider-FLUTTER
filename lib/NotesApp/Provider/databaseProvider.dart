import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:wslc_323_provider/NotesApp/Database/DbHelper.dart';
import 'package:wslc_323_provider/NotesApp/Models/NotesModel.dart';

class DatabaseProvider extends ChangeNotifier {
  Future<void> AddNotes(NotesModel newnote) async {
    await  DbHelper().addNotes(newnote);
    log("Added Data");
  }
  List<NotesModel>arrnotes=[];
  Future<void> fetchNotes()async{
    arrnotes=await DbHelper().fetchNotes();
    notifyListeners();
  }
}
