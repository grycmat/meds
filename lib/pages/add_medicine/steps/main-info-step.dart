import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meds/model/med-types.dart';
import 'package:meds/providers/add-medicine-model-provider.dart';
import 'package:provider/provider.dart';

class MainInfoStep extends StatelessWidget {
  const MainInfoStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddMedicineModelProvider>(
      builder: (_, addMedicineModelProvider, __) => Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            onChanged: (val) {
              addMedicineModelProvider.medName = val;
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Name'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ToggleButtons(
            children: const [
              FaIcon(FontAwesomeIcons.pills),
              FaIcon(FontAwesomeIcons.syringe),
              FaIcon(FontAwesomeIcons.weight),
            ],
            onPressed: (int index) {
              addMedicineModelProvider.medType = MedTypes[index];
            },
            isSelected: List<bool>.generate(3,
                (index) => addMedicineModelProvider.medType == MedTypes[index]),
          ),
        ),
      ]),
    );
  }
}
