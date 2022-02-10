import 'package:flutter/material.dart';
import 'package:meds/pages/add_medicine/steps/main-info-step.dart';
import 'package:meds/pages/add_medicine/steps/schedule-step.dart';
import 'package:meds/pages/add_medicine/steps/step-additional-info.dart';
import 'package:meds/providers/add-medicine-provider.dart';
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
                content: const ScheduleStep()),
            Step(
              title: Text(
                provider.getStepName(key: 'additional'),
              ),
              content: const StepAdditionalInfo(),
            )
          ]),
    );
  }
}
