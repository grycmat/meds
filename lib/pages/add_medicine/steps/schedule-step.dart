import 'package:flutter/material.dart';
import 'package:meds/model/frequency-names.dart';
import 'package:meds/model/med.dart';
import 'package:meds/pages/add_medicine/add-medicine-list-tile.dart';

class ScheduleStep extends StatelessWidget {
  const ScheduleStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddMedicineListTile(
          title: FrequencyNames[Frequency.one]!,
          frequency: Frequency.one,
          numberOfTimeSelectors: 1,
        ),
        AddMedicineListTile(
          title: FrequencyNames[Frequency.two]!,
          frequency: Frequency.two,
          numberOfTimeSelectors: 2,
        ),
        AddMedicineListTile(
          title: FrequencyNames[Frequency.three]!,
          frequency: Frequency.three,
          numberOfTimeSelectors: 3,
        )
      ],
    );
  }
}
