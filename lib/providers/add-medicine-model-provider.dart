import 'package:flutter/material.dart';
import 'package:meds/providers/frequency-enum.dart';
import 'package:meds/providers/med-type-enum.dart';

class AddMedicineModelProvider extends ChangeNotifier {
  Frequency _frequency = Frequency.one;
  String _medName = '';
  MedType _medType = MedType.Pill;
  List<int> _dozes = [1, 1, 1];
  List<TimeOfDay> _times = List<TimeOfDay>.generate(
    3,
    (index) => TimeOfDay(hour: 8 + index, minute: 0),
  );

  get frequency => _frequency;
  get medName => _medName;
  List<int> get dozes => _dozes;
  MedType get medType => _medType;
  List<TimeOfDay> get times => _times;

  set frequency(value) {
    _frequency = value;
    notifyListeners();
  }

  set medName(value) {
    _medName = value;

    notifyListeners();
  }

  set medType(MedType type) {
    _medType = type;
    notifyListeners();
  }

  set dozes(List<int> dozes) {
    _dozes = dozes;

    notifyListeners();
  }

  set times(List<TimeOfDay> times) {
    _times = times;

    notifyListeners();
  }

  modifyDoze({required index, required int doze}) {
    _dozes[index] = doze;
    notifyListeners();
  }

  modifyTime({required index, required TimeOfDay time}) {
    _times[index] = time;
    notifyListeners();
  }
}
