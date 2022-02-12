import 'package:flutter/material.dart';
import 'package:meds/model/med-names.dart';
import 'package:meds/model/step-names.dart';
import 'package:meds/pages/add_medicine/steps/main-info-step.dart';
import 'package:meds/pages/add_medicine/steps/schedule-step.dart';
import 'package:meds/pages/add_medicine/steps/additional-info-step.dart';
import 'package:meds/providers/add-medicine-model-provider.dart';
import 'package:provider/provider.dart';

class AddMedicineStepper extends StatefulWidget {
  const AddMedicineStepper({Key? key}) : super(key: key);

  @override
  State<AddMedicineStepper> createState() => _AddMedicineStepperState();
}

class _AddMedicineStepperState extends State<AddMedicineStepper> {
  final int _numberOfSteps = 2;
  late int _step;

  _getStepName({required StepName key}) => StepNames[key];

  String _generateMainInfoStepName(
          {required AddMedicineModelProvider provider}) =>
      provider.medName != ''
          ? '${provider.medName}, ${MedNames[provider.medType]}'
          : '';

  @override
  initState() {
    _step = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddMedicineModelProvider>(
      builder: (_, addMedicineModelProvider, __) => Stepper(
          controlsBuilder: (context, details) => Container(
                child: _step < _numberOfSteps
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: details.onStepContinue,
                            child: const Text('Next'),
                          ),
                        ],
                      )
                    : null,
              ),
          onStepContinue: () {
            setState(() {
              _step++;
            });
          },
          onStepTapped: (index) {
            setState(() {
              _step = index;
            });
          },
          currentStep: _step,
          steps: [
            Step(
              title: Text(
                _generateMainInfoStepName(provider: addMedicineModelProvider),
              ),
              content: const MainInfoStep(),
            ),
            Step(
              title: Text(
                _getStepName(key: StepName.schedule),
              ),
              content: const ScheduleStep(),
            ),
            Step(
              title: Text(
                _getStepName(key: StepName.additional),
              ),
              content: const AdditionalInfoStep(),
            )
          ]),
    );
  }
}
