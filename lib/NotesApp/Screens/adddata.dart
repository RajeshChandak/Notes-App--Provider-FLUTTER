import 'package:flutter/material.dart';
import 'package:wslc_323_provider/NotesApp/Models/NotesModel.dart';
import 'package:wslc_323_provider/NotesApp/Provider/databaseProvider.dart';
import 'package:wslc_323_provider/NotesApp/Screens/notesapp.dart';
import 'package:wslc_323_provider/NotesApp/widget/CustomWidgets.dart';
import 'package:provider/provider.dart';

class addData extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Notes", style: TextStyle(fontFamily: "regular", fontWeight: FontWeight.w900),),
          toolbarHeight: 50,
          titleSpacing: 0,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 10,),
              UiHelper.CustomTextField(
                  controller: titleController,
                  TextInputType: TextInputType.text,
                  hinttext: "Title",
                  icondata: Icons.title_rounded),
              UiHelper.CustomTextField(
                  controller: descriptionController,
                  TextInputType: TextInputType.text,
                  hinttext: "Description",
                  icondata: Icons.description_outlined),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          addNotes(titleController.text.toString(), descriptionController.text, context);
        }, child: Icon(Icons.save_as_outlined, ),backgroundColor: Colors.deepPurpleAccent,),
    );
  }
  addNotes(String title, String description, BuildContext context)async{
    if(title=="" || description==""){
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter Required Fields", style: TextStyle(color: Colors.white, ),), backgroundColor: Colors.red,duration: Duration(milliseconds: 700),));
    }
    else{
      context.read<DatabaseProvider>().AddNotes(NotesModel(title: title, description: description));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>notesApp()));
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Data Added Successfully!", style: TextStyle(color: Colors.white),),backgroundColor: Colors.deepPurple,duration: Duration(milliseconds: 700),));
      }
    }
  }

