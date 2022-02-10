import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meds/pages/add_medicine/add-medicine-list-tile.dart';
import 'package:meds/pages/add_medicine/steps/main-info-step.dart';
import 'package:meds/providers/add-medicine-provider.dart';
import 'package:meds/providers/frequency-enum.dart';
import 'package:provider/provider.dart';

class AddMedicineStepper extends StatelessWidget {
  const AddMedicineStepper({Key? key}) : super(key: key);

  String _generateFirstStepName({required AddMedicineProvider provider}) {
    if (provider.medName != '') {
      for (var element in provider.medTypes.entries) {
        if (element.value) {
          return '${provider.medName}, ${element.key}';
        }
      }
    }
    return '';
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
              content: const MainInfoStep(),
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
