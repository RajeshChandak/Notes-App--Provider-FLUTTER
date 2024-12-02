//Shree

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wslc_323_provider/NotesApp/Provider/databaseProvider.dart';
import 'package:wslc_323_provider/NotesApp/Screens/notesapp.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>DatabaseProvider()),  //DependencyInjection
        ],
        child: MaterialApp(
          home: notesApp(),
          title: "Notes App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white10,
              useMaterial3: false,
              appBarTheme: AppBarTheme(
                  color: Colors.deepPurpleAccent,
                  centerTitle: false,
                  elevation: 0
              )),
        ),
      );

  }
}

