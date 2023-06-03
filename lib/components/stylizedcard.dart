import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StylizedCard extends StatelessWidget {
  const StylizedCard({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Padding(
          padding: const EdgeInsets.all(15),
          child: child),
    );
  }

}