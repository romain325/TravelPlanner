import 'package:flutter/material.dart';

class NewStepForm extends StatefulWidget {
  const NewStepForm({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => NewStepFormState();
}

class NewStepFormState extends State<NewStepForm> {
  final _formKey = GlobalKey<FormState>();
  String? type = "Destination";

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: ListTile(
                  title: const Text("Destination"),
                  leading: Radio<String>(
                    value: "Destination",
                    groupValue: type,
                    onChanged: (String? val) {
                      setState(() {
                        type = val;
                      });
                    },
                  ),
                )),
                Expanded(child: ListTile(
                  title: const Text("Transportation"),
                  leading: Radio<String>(
                    value: "Transportation",
                    groupValue: type,
                    onChanged: (String? val) {
                      setState(() {
                        type = val;
                      });
                    },
                  ),
                ))
              ],
            ),
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
            const Divider(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Creating step")));
                  }
                },
                child: const Text("Continue"),
              ),
            )
          ],
        ));
  }
}
