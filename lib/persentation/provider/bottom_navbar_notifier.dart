import 'package:flutter/widgets.dart';

class BottomNavbarNotifier with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int newValue) {
    _currentIndex = newValue;
    notifyListeners();
  }
}
