import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travelplanner/models/destination.dart';
import 'package:travelplanner/views/roadmappage.dart';

class NewStepForm extends StatefulWidget {
  final String travelId;
  const NewStepForm({Key? key, required this.travelId}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NewStepFormState();
}

class NewStepFormState extends State<NewStepForm> {
  final _formKey = GlobalKey<FormState>();
  String? type = "Destination";

  final nameController = TextEditingController();
  final startDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: ListTile(
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
                Expanded(
                    child: ListTile(
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
                  startDateController.text =
                      value.millisecondsSinceEpoch.toString();
                },
                fieldLabelText: "Start date",
                firstDate: DateTime(0),
                lastDate: DateTime.now().add(const Duration(days: 365 * 100))),
            const Divider(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Creating step")));
                    Destination(
                            DateTime.now().millisecondsSinceEpoch.toString(),
                            nameController.text,
                            "",
                            DateTime.fromMillisecondsSinceEpoch(
                                    int.parse(startDateController.text))
                                .add(const Duration(days: 2))
                                .millisecondsSinceEpoch
                                .toString(),
                            startDateController.text,
                            widget.travelId)
                        .insertDestination()
                        .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RoadMapPage(id: widget.travelId))))
                        .catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Not able to create")));
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Not able to create")));
                  }
                },
                child: const Text("Continue"),
              ),
            )
          ],
        ));
  }
}
