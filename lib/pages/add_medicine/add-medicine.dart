import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meds/pages/add_medicine/add-medicine-stepper.dart';
import 'package:meds/providers/add-medicine-model-provider.dart';
import 'package:provider/provider.dart';

class AddMedicine extends StatelessWidget {
  const AddMedicine({Key? key}) : super(key: key);

  void _saveMedicine(AddMedicineModelProvider medicine) {}

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddMedicineModelProvider>(
          create: (_) => AddMedicineModelProvider(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: ElevatedButton(
              onPressed: () {}, child: FaIcon(FontAwesomeIcons.ban)),
          actions: [
            ElevatedButton(
                onPressed: () {
                  var medicine = Provider.of<AddMedicineModelProvider>(context,
                      listen: false);
                  _saveMedicine(medicine);
                },
                child: FaIcon(FontAwesomeIcons.check))
          ],
        ),
        body: const SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: AddMedicineStepper(),
            ),
          ),
        ),
      ),
    );
  }
}
