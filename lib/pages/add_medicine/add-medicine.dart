import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meds/pages/add_medicine/add-medicine-stepper.dart';
import 'package:meds/providers/add-medicine-model-provider.dart';
import 'package:provider/provider.dart';

class AddMedicine extends StatelessWidget {
  const AddMedicine({Key? key}) : super(key: key);

  Future<int> _saveMedicine(AddMedicineModelProvider provider) async {
    return provider.save();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddMedicineModelProvider>(
          create: (_) => AddMedicineModelProvider(),
        ),
      ],
      child: Consumer<AddMedicineModelProvider>(
        builder: (_, provider, __) => Scaffold(
          appBar: AppBar(
            leading: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: FaIcon(FontAwesomeIcons.ban)),
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    await _saveMedicine(provider);
                    Navigator.of(context).pop();
                  },
                  child: FaIcon(FontAwesomeIcons.check))
            ],
          ),
          body: SafeArea(
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
