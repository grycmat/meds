import 'package:flutter/material.dart';
import 'package:meds/model/med.dart';

class AddMedicineModel extends ChangeNotifier {
  Frequency _frequency = Frequency.one;
  String _medName = '';
  MedType _medType = MedType.pill;
  final List<int> _dozes = [];
  final List<TimeOfDay> _times = [];

  Frequency get frequency => _frequency;
  get medName => _medName;
  MedType get medType => _medType;
  List<int> get dozes => _dozes;
  List<TimeOfDay> get times => _times;

  set frequency(Frequency f) {
    _frequency = f;
    notifyListeners();
  }

  set medType(MedType type) {
    _medType = type;
    notifyListeners();
  }

  set dozes(List<int> dozesList) {
    dozes;
  }
}
