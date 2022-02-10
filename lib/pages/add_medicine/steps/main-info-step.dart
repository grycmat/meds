import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meds/providers/add-medicine-provider.dart';
import 'package:provider/provider.dart';

class MainInfoStep extends StatelessWidget {
  const MainInfoStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddMedicineProvider>(
      builder: (_, provider, __) => Column(children: [
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
    );
  }
}
