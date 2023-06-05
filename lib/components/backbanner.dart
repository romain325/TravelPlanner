import 'package:flutter/material.dart';

class BackBanner extends StatelessWidget {

  const BackBanner(
      {required this.title,
      required this.onTap,
      super.key,
      this.subtitle = ""});

  final String title;
  final String subtitle;
  final Function() onTap;

  TextStyle? fontStyle(BuildContext context) =>
      Theme.of(context).textTheme.displaySmall;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return GestureDetector(
        onTap: onTap,
        child: Container(
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            color: Color.fromRGBO(
                primaryColor.red, primaryColor.green, primaryColor.blue, 0.4),
            child: Row(
              children: <Widget>[
                const Expanded(
                  flex: 2, // takes 30% of available width
                  child: Icon(Icons.arrow_circle_left_outlined,
                      size: 40, color: Colors.purple),
                ),
                Expanded(
                    flex: 7, // takes 70% of available width
                    child: Column(
                      children: [
                        const SizedBox(height: 6),
                        Text(title,
                            style: const TextStyle(
                                fontSize: 23,
                                color: Colors.purple,
                                fontWeight: FontWeight.bold)),
                        getSubtitle(),
                        const SizedBox(height: 6)
                      ],
                    )),
              ],
            )));
  }

  getSubtitle() {
    if(subtitle != ""){
      return Column(
        children: [
          const SizedBox(height: 6),
          Center(
            child: Text(subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              textAlign: TextAlign.center,
            ),

          )
        ],
      );
    }else{
      return const SizedBox(height: 0);
    }

  }

}
