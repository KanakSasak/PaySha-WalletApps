import 'package:flutter/widgets.dart';

class ScannerNotifier extends ChangeNotifier {
  bool _flashOn = false;
  bool _frontCam = false;

  bool get flashOn => _flashOn;
  bool get frontCam => _frontCam;

  set flashOn(bool val) {
    _flashOn = val;
    notifyListeners();
  }

  set frontCam(bool val) {
    _frontCam = val;
    notifyListeners();
  }
}
