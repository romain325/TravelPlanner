import 'package:flutter/material.dart';

class NewTravelForm extends StatefulWidget {
  const NewTravelForm({super.key});

  @override
  State<StatefulWidget> createState() => NewTravelFormState();
}

class NewTravelFormState extends State<NewTravelForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Name",
              ),
              validator: (String? value) {
                return value == null || value.isEmpty ? "Enter Name" : null;
              },
            ),
            // https://github.com/flutter/flutter/issues/68042
            InputDatePickerFormField(
                fieldLabelText: "Start date",
                firstDate: DateTime(0),
                lastDate: DateTime.now().add(const Duration(days: 365 * 100))),
            InputDatePickerFormField(
                firstDate: DateTime(0),
                lastDate: DateTime.now().add(const Duration(days: 365 * 100))),
            TextFormField(
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
