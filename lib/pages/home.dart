import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meds/pages/add_medicine/add-medicine.dart';
import 'package:meds/pages/meds-list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/meds_background.jpg'),
            ),
          ),
          child: const MedsList()),
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        shadowColor: Colors.blueGrey,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.blue[600]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              FaIcon(FontAwesomeIcons.calendar),
              FaIcon(FontAwesomeIcons.list)
            ],
          ),
        ),
      ),
      floatingActionButton: OpenContainer(
        transitionDuration: const Duration(seconds: 1),
        transitionType: ContainerTransitionType.fade,
        openBuilder: (_, __) => const AddMedicine(),
        closedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40))),
        closedBuilder: (_, VoidCallback callback) => Container(
          child: FloatingActionButton(
            onPressed: callback,
            child: const Icon(Icons.add),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
