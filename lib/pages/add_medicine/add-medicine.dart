import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meds/pages/add_medicine/add-medicine-stepper.dart';
import 'package:meds/providers/add-medicine-provider.dart';
import 'package:provider/provider.dart';

enum Frequency { one, two, three }

class AddMedicine extends StatefulWidget {
  const AddMedicine({Key? key}) : super(key: key);

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ChangeNotifierProvider<AddMedicineProvider>(
                create: (context) => AddMedicineProvider(),
                child: AddMedicineStepper(),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const FaIcon(FontAwesomeIcons.check),
        ));
  }
}
