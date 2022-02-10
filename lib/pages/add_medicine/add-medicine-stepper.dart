import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meds/providers/add-medicine-provider.dart';
import 'package:provider/provider.dart';

class AddMedicineStepper extends StatelessWidget {
  AddMedicineStepper({Key? key}) : super(key: key);
  Widget _generateTimeDisplay(
      {required BuildContext context,
      required int number,
      required List<TimeOfDay> times,
      required List<int> doze}) {
    return Column(children: [
      for (int i = 0; i < number; i++) ...[
        _generateTimeItem(
            context: context, index: i, time: times[i], doze: doze[i])
      ]
    ]);
  }

  Widget _generateTimeItem(
      {required BuildContext context,
      required int index,
      required TimeOfDay time,
      required int doze}) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
              onEditingComplete: () {},
              onTap: () => showTimePicker(context: context, initialTime: time),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: SizedBox(
                    width: 10,
                    child: Center(child: FaIcon(FontAwesomeIcons.clock))),
              ),
              initialValue:
                  '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}'),
        ),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: SizedBox(
                width: 10,
                child: Center(
                  child: FaIcon(FontAwesomeIcons.sortNumericUpAlt),
                ),
              ),
            ),
            initialValue: doze.toString(),
          ),
        ),
      ],
    );
  }

  String _generateFirstStepName({required AddMedicineProvider provider}) {
    print(provider.medName);
    print(provider.medTypes.toString());
    if (provider.medName != '') {
      for (var element in provider.medTypes.entries) {
        if (element.value) {
          return '${provider.medName}, ${element.key}';
        }
      }
    }
    return '';

    // return provider.medName != ''
    //     ? '${provider.medName}, ${medType}'
    //     : 'Add medicine';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddMedicineProvider>(
      builder: (_, provider, __) => Stepper(
          controlsBuilder: (context, details) => ElevatedButton(
                onPressed: details.onStepContinue,
                child: const Text('Next'),
              ),
          onStepContinue: () {
            provider.step = provider.step + 1;
          },
          onStepTapped: (index) {
            provider.step = index;
          },
          currentStep: provider.step,
          steps: [
            Step(
              title: Text(_generateFirstStepName(provider: provider)),
              content: Column(children: [
                TextField(
                  onChanged: (val) {
                    provider.medName = val;
                  },
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
                    for (var i = 0; i <= index; i++) {
                      provider.setMedType(i, index == i ? true : false);
                    }
                  },
                  isSelected: provider.medTypes.values.toList(),
                ),
              ]),
            ),
            Step(
              title: Text(
                provider.getStepName(key: 'schedule'),
              ),
              content: Column(
                children: const [
                  AddMedicineListTile(
                    title: 'One time a day',
                    frequency: Frequency.one,
                    numberOfTimeSelectors: 1,
                  ),
                  AddMedicineListTile(
                    title: 'Two times a day',
                    frequency: Frequency.two,
                    numberOfTimeSelectors: 2,
                  ),
                  AddMedicineListTile(
                    title: 'Three times a day',
                    frequency: Frequency.three,
                    numberOfTimeSelectors: 3,
                  )
                ],
              ),
            ),
            Step(
              title: Text(
                provider.getStepName(key: 'additional'),
              ),
              content: Column(
                children: const [
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Stock',
                        border: OutlineInputBorder(),
                        prefixIcon: SizedBox(
                          width: 20,
                          child: Center(
                            child: FaIcon(FontAwesomeIcons.medkit),
                          ),
                        )),
                  ),
                  TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: 'Comment',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}

class AddMedicineListTile extends StatelessWidget {
  const AddMedicineListTile(
      {Key? key,
      required this.title,
      required this.frequency,
      required this.numberOfTimeSelectors})
      : super(key: key);
  final String title;
  final Frequency frequency;
  final int numberOfTimeSelectors;
  Widget _generateTimeDisplay(
      {required BuildContext context,
      required int number,
      required List<TimeOfDay> times,
      required List<int> doze}) {
    return Column(children: [
      for (int i = 0; i < number; i++) ...[
        _generateTimeItem(
            context: context, index: i, time: times[i], doze: doze[i])
      ]
    ]);
  }

  Widget _generateTimeItem(
      {required BuildContext context,
      required int index,
      required TimeOfDay time,
      required int doze}) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
              onEditingComplete: () {},
              onTap: () => showTimePicker(context: context, initialTime: time),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: SizedBox(
                    width: 10,
                    child: Center(child: FaIcon(FontAwesomeIcons.clock))),
              ),
              initialValue:
                  '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}'),
        ),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: SizedBox(
                width: 10,
                child: Center(
                  child: FaIcon(FontAwesomeIcons.sortNumericUpAlt),
                ),
              ),
            ),
            initialValue: doze.toString(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddMedicineProvider>(
      builder: (_, provider, __) => Column(
        children: [
          RadioListTile<Frequency>(
            title: Text(title),
            value: frequency,
            groupValue: provider.frequency,
            onChanged: (Frequency? f) {
              provider.frequency = f;
            },
          ),
          Container(
            child: provider.frequency == frequency
                ? _generateTimeDisplay(
                    context: context,
                    number: numberOfTimeSelectors,
                    times: provider.times,
                    doze: provider.doze)
                : null,
          ),
        ],
      ),
    );
  }
}
