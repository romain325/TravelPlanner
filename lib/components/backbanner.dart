import 'package:flutter/material.dart';

class BackBanner extends StatelessWidget {
  const BackBanner({super.key, required this.message, required this.onTap });

  final String message;
  final Function(BuildContext context) onTap;
  TextStyle? fontStyle(BuildContext context) =>
      Theme.of(context).textTheme.displaySmall;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return GestureDetector(
        onTap: () => {},
        child: Container(
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            color: Color.fromRGBO(
                primaryColor.red, primaryColor.green, primaryColor.blue, 0.4),
            child: Row(
              children: <Widget>[
                Icon(Icons.arrow_back,
                    size: fontStyle(context)?.fontSize,
                    color: fontStyle(context)?.color),
                DefaultTextStyle(
                    style: fontStyle(context)!, child: Text(message))
              ],
            )));
  }
}
