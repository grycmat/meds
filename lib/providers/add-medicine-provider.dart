import 'package:flutter/material.dart';
import 'package:meds/providers/frequency-enum.dart';

class AddMedicineProvider extends ChangeNotifier {
  final Map<String, String> _stepName = {
    'name': 'Basic info',
    'schedule': 'Schedule',
    'additional': 'Supplies, Comment',
  };
  Frequency? _frequency = Frequency.one;
  int _step = 0;
  String? _medName;
  final Map<String, bool> _medTypes = {
    'Pill': true,
    'Syringe': false,
    'Test': false
  };
  final List<int> _doze = [1, 1, 1];
  final List<TimeOfDay> _times = List.generate(
    3,
    (index) => TimeOfDay(hour: 8 + index, minute: 0),
  );

  get frequency => _frequency;
  get step => _step;
  get medName => _medName;
  Map<String, bool> get medTypes => _medTypes;
  get doze => _doze;
  get times => _times;
  getStepName({required String key}) => _stepName[key];
  setStepName({required String key, required String value}) {
    _stepName[key] = value;
    notifyListeners();
  }

  set frequency(value) {
    _frequency = value;
    notifyListeners();
  }

  set step(value) {
    _step = value;

    notifyListeners();
  }

  set medName(value) {
    _medName = value;

    notifyListeners();
  }

  setMedType(index, value) {
    var key = _medTypes.keys.toList()[index];
    _medTypes.update(key, (current) => value);

    notifyListeners();
  }

  setDoze(index, value) {
    _doze[index] = value;

    notifyListeners();
  }

  setTimes(index, value) {
    _times[index] = value;

    notifyListeners();
  }
}
