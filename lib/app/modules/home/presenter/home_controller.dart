import 'package:flutter/material.dart';

class HomeController extends ValueNotifier<int> {
  HomeController() : super(0);

  void changeMenu(int newIndex) {
    value = newIndex;
    notifyListeners();
  }
}
