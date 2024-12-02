import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wslc_323_provider/NotesApp/Provider/databaseProvider.dart';
import 'package:wslc_323_provider/NotesApp/Screens/adddata.dart';

class notesApp extends StatelessWidget {
  // const notesApp({super.key});

  @override
  Widget build(BuildContext context) {
    final noteprovider = Provider.of<DatabaseProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("NotesApp", style: TextStyle(fontFamily: "regular", fontWeight: FontWeight.w900),),
        toolbarHeight: 51,
        titleSpacing: 0,
        leading: Icon(Icons.edit_note_sharp),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18, bottom: 71),
        child: FutureBuilder(
          future: noteprovider.fetchNotes(),
          builder: (context, snapshot){
            // if(snapshot.connectionState==ConnectionState.waiting){
            //   return Center(child: CircularProgressIndicator(),);
            // }
              return ListView.builder(itemBuilder: (context, index) {
                return ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 8.0,),
                    child: CircleAvatar(child: Text("${index+1}".toString(), style: TextStyle(color: Colors.white, fontSize: 18,fontFamily: "regular"),),radius: 12,backgroundColor: Colors.deepPurpleAccent,),
                  ),
                  title: Text(noteprovider.arrnotes[index].title,style: TextStyle(color: Colors.white, fontFamily: "regular"),),
                  subtitle: Text(noteprovider.arrnotes[index].description,style: TextStyle(color: Colors.white, fontFamily: "regular"),),
                );
              },itemCount: noteprovider.arrnotes.length,);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addData()));
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
