import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Frequency { one, two, three }

class AddMedicine extends StatefulWidget {
  const AddMedicine({Key? key}) : super(key: key);

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  Frequency? _frequency = Frequency.one;
  final List<bool> _medType = [true, false, false];
  final List<TimeOfDay> _times = List.generate(
    3,
    (index) => TimeOfDay(hour: 8 + index, minute: 0),
  );

  Widget _generateTimeDisplay(int number) {
    return Column(children: [
      for (int i = 0; i < number; i++) ...[_generateTimeItem(_times[i])]
    ]);
  }

  Widget _generateTimeItem(TimeOfDay time) {
    return TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: FaIcon(FontAwesomeIcons.clock),
        ),
        initialValue:
            '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Name'),
              ),
              ToggleButtons(
                children: const [
                  FaIcon(FontAwesomeIcons.pills),
                  FaIcon(FontAwesomeIcons.syringe),
                  FaIcon(FontAwesomeIcons.weight),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (var i = 0; i <= index; i++) {
                      _medType[i] = index == i ? true : false;
                    }
                  });
                },
                isSelected: _medType,
              ),
              RadioListTile<Frequency>(
                title: const Text('Once a day'),
                value: Frequency.one,
                groupValue: _frequency,
                onChanged: (Frequency? f) {
                  setState(() {
                    _frequency = f;
                  });
                },
              ),
              Container(
                child: _frequency == Frequency.one
                    ? _generateTimeDisplay(1)
                    : null,
              ),
              RadioListTile<Frequency>(
                title: const Text('Two times a day'),
                value: Frequency.two,
                groupValue: _frequency,
                onChanged: (Frequency? f) {
                  setState(() {
                    _frequency = f;
                  });
                },
              ),
              Container(
                  child: _frequency == Frequency.two
                      ? _generateTimeDisplay(2)
                      : null),
              RadioListTile<Frequency>(
                title: const Text('Three times a day'),
                value: Frequency.three,
                groupValue: _frequency,
                onChanged: (Frequency? f) {
                  setState(() {
                    _frequency = f;
                  });
                },
              ),
              Container(
                  child: _frequency == Frequency.three
                      ? _generateTimeDisplay(3)
                      : null),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Comment',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
