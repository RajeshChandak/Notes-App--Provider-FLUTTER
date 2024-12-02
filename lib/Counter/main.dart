import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wslc_323_provider/Counter/Provider/counterprovider.dart';
import 'package:wslc_323_provider/Counter/Screens/CounterApp.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(                 //Dependancy Injection
      create: (context)=>CounterProvider(),
      child: MaterialApp(
        home: CounterApp(),
        title: "Counter",
        debugShowCheckedModeBanner: false,
      ),
    );
  }

}