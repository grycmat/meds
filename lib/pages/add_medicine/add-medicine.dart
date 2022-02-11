import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meds/pages/add_medicine/add-medicine-stepper.dart';
import 'package:meds/providers/add-medicine-model-provider.dart';
import 'package:meds/providers/stepper-provider.dart';
import 'package:provider/provider.dart';

class AddMedicine extends StatelessWidget {
  const AddMedicine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddMedicineModelProvider>(
          create: (_) => AddMedicineModelProvider(),
        ),
      ],
      child: Scaffold(
        body: const SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: AddMedicineStepper(),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const FaIcon(FontAwesomeIcons.check),
        ),
      ),
    );
  }
}
