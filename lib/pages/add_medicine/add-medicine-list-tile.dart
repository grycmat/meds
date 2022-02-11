import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meds/providers/add-medicine-model-provider.dart';
import 'package:meds/providers/frequency-enum.dart';
import 'package:provider/provider.dart';

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
    return Consumer<AddMedicineModelProvider>(
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
                    doze: provider.dozes)
                : null,
          ),
        ],
      ),
    );
  }
}
