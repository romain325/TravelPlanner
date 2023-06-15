import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travelplanner/components/backbanner.dart';
import 'package:travelplanner/components/navbar.dart';
import 'package:travelplanner/components/stepcard.dart';
import 'package:travelplanner/models/destination.dart';
import 'package:travelplanner/models/journey.dart';
import 'package:travelplanner/models/travel.dart';
import 'package:travelplanner/utils.dart';
import 'package:travelplanner/views/newtravelstep.dart';

class RoadMapPage extends StatefulWidget {
  final String id;
  const RoadMapPage({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RoadMapPageState();
}

class RoadMapPageState extends State<RoadMapPage> {
  Travel? travel;
  List<StepCard> dest = [];
  @override
  void initState() {
    super.initState();
    Travel.getTravel(widget.id).then((value) => setState((){ travel = value; }));
    getStepCards().then((value) => setState(() {
      dest = value;
    }));
  }

  Future<List<StepCard>> getStepCards() async {
    List<StepCard> tmpList = [];
    for(Destination tmp in await Destination.getDestinations(widget.id)) {
      tmpList.add(StepCard(name: tmp.city, startDate: DateTime.fromMillisecondsSinceEpoch(int.tryParse(tmp.start_date) ?? 0) , type: "destination", destId: tmp.id));
    }
    return tmpList;
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
        bottomNavigationBar: const NavBar(),
        body: Column(
          children: <Widget>[
            BackBanner(
                title: "Roadtrip ${travel?.title}",
                onTap: () {
                  Navigator.pop(context);
                }),
            // SCROLLABLE ICI
            SingleChildScrollView(
                child: Column(
              children: <Widget>[
                Text("Départ: ${formatDate(travel?.start_date ?? "")}"),
                Column(
                  children: dest,
                ),
                Text("Arrivée: ${formatDate(travel?.end_date ?? "")}"),
              ],
            )),
            Container(
                color: Color.fromRGBO(primaryColor.red, primaryColor.green,
                    primaryColor.blue, 0.3),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewTravelStep(travelId: widget.id)));
                  },
                  style: TextButton.styleFrom(backgroundColor: primaryColor),
                  child: const Text("Add step"),
                ))
          ],
        ));
  }
}
