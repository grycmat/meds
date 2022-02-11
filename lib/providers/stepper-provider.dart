import 'package:flutter/cupertino.dart';

/// @deprecated
class StepperProvider extends ChangeNotifier {
  int _step = 0;

  get step => _step;
  set step(step) {
    _step = step;
    notifyListeners();
  }
}
