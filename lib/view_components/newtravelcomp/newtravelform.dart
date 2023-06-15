import 'package:flutter/material.dart';
import 'package:travelplanner/main.dart';
import 'package:travelplanner/models/travel.dart';

class NewTravelForm extends StatefulWidget {
  const NewTravelForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NewTravelFormState();
}

class NewTravelFormState extends State<NewTravelForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final departureController = TextEditingController();
  final arrivalController = TextEditingController();
  final startController = TextEditingController();
  final endController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
              validator: (String? value) {
                return value == null || value.isEmpty ? "Enter Name" : null;
              },
            ),
            // https://github.com/flutter/flutter/issues/68042
            InputDatePickerFormField(
                onDateSaved: (value) {
                  startController.text = value.millisecondsSinceEpoch.toString();
                },
                fieldLabelText: "Start date",
                firstDate: DateTime(0),
                lastDate: DateTime.now().add(const Duration(days: 365 * 100))),
            InputDatePickerFormField(
                onDateSaved: (value) {
                  endController.text = value.millisecondsSinceEpoch.toString();
                },
                firstDate: DateTime(0),
                lastDate: DateTime.now().add(const Duration(days: 365 * 100))),
            TextFormField(
              controller: departureController,
              decoration: const InputDecoration(
                labelText: "Departure",
              ),
              validator: (String? value) {
                return value == null || value.isEmpty
                    ? "Enter Departure"
                    : null;
              },
            ),
            TextFormField(
              controller: arrivalController,
              decoration: const InputDecoration(
                labelText: "Arrival",
              ),
              validator: (String? value) {
                return value == null || value.isEmpty ? "Enter Arrival" : null;
              },
            ),
            const Divider(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    Travel(
                            DateTime.now().millisecondsSinceEpoch.toString(),
                            arrivalController.text,
                            departureController.text,
                            endController.text,
                            startController.text,
                            nameController.text,
                            MyApp.user!.user!.uid)
                        .insertTravel()
                        .then((value) => Navigator.pop(context));

                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Creating travel")));
                  }
                },
                child: const Text("Continue"),
              ),
            )
          ],
        ));
  }
}
