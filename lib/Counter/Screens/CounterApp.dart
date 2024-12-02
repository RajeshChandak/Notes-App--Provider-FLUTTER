import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wslc_323_provider/Counter/Provider/counterprovider.dart';

class CounterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final counter = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: false,
        titleSpacing: 21,
        backgroundColor: Colors.amber,
      ),
      body: Center(child: Text(counter.initialCount.toString(), style: TextStyle(fontSize: 50),)),
      floatingActionButton: FloatingActionButton(onPressed: (){
        counter.increment();
      }, child: Icon(Icons.add),),
    );
  }
}