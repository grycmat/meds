import 'package:flutter/material.dart';
import 'package:meds/model/med.dart';
import 'package:meds/pages/add_medicine/add-medicine-list-tile.dart';

class ScheduleStep extends StatelessWidget {
  const ScheduleStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
