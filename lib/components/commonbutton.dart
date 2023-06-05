import 'package:flutter/material.dart';

import '../../models/day.dart';

class CommonButton extends StatefulWidget {

  final String content;
  final Function() onPressed;

  const CommonButton(this.content, this.onPressed, {super.key});

  @override
  State<StatefulWidget> createState() => CommonButtonState();

}

class CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: Colors.purple),
                      )),
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: widget.onPressed,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(widget.content,
                    style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                    )),
              )),
        ]));
  }
}