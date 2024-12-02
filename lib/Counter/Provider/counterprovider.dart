import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{
  int initialCount=0;
  increment(){
    initialCount++;
    notifyListeners();
  }

}