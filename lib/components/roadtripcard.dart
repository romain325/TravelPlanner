import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travelplanner/views/roadmappage.dart';

class RoadTripCard extends StatefulWidget {
  const RoadTripCard(
      {super.key,
      required this.name,
      required this.startDate,
      required this.endDate,
      required this.departure,
      required this.arrival,
      required this.destCnt,
      required this.id});

  final String id;
  final String name;
  final DateTime? startDate;
  final DateTime? endDate;
  final String departure;
  final String arrival;
  final int destCnt;

  @override
  State<StatefulWidget> createState() => RoadTripCardState();
}

class RoadTripCardState extends State<RoadTripCard> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RoadMapPage(id: widget.id))),
        child: Card(
            elevation: 1,
            margin: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).colorScheme.primary),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: DefaultTextStyle(
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .merge(TextStyle(
                                color: Theme.of(context).primaryColor)),
                        child: Text(widget.name, textAlign: TextAlign.start)),
                  ),
                  Center(
                    widthFactor: 1.5,
                    child: Text(
                        "${widget.startDate?.day}-${widget.startDate?.month}-${widget.startDate?.year}"
                        " / ${widget.endDate?.day}-${widget.endDate?.month}-${widget.endDate?.year}"),
                  ),
                  Center(
                    child: IntrinsicHeight(
                        child: Center(
                      widthFactor: 1.1,
                      child: Row(
                        children: <Widget>[
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              DefaultTextStyle(
                                  style:
                                      Theme.of(context).textTheme.labelSmall!,
                                  child: const Text("Departure")),
                              DefaultTextStyle(
                                  style:
                                      Theme.of(context).textTheme.labelSmall!,
                                  child: const Text("Destinations")),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              DefaultTextStyle(
                                style: Theme.of(context).textTheme.bodyMedium!,
                                child: Text(widget.departure),
                              ),
                              DefaultTextStyle(
                                style: Theme.of(context).textTheme.bodyMedium!,
                                child: Text(widget.destCnt.toString()),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 50,
                            thickness: 2,
                            indent: 5,
                            endIndent: 5,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              DefaultTextStyle(
                                  style:
                                      Theme.of(context).textTheme.labelSmall!,
                                  child: const Text("Arrival")),
                              DefaultTextStyle(
                                  style:
                                      Theme.of(context).textTheme.labelSmall!,
                                  child: const Text("Duration")),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              DefaultTextStyle(
                                style: Theme.of(context).textTheme.bodyMedium!,
                                child: Text(widget.arrival),
                              ),
                              DefaultTextStyle(
                                  style:
                                      Theme.of(context).textTheme.bodyMedium!,
                                  child: Text(widget.endDate
                                          ?.difference(widget.startDate ??
                                              DateTime.now())
                                          .inDays
                                          .toString() ??
                                      "?")),
                            ],
                          ),
                        ],
                      ),
                    )),
                  )
                ],
              ),
            )));
  }
}
