import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travelplanner/components/navbar.dart';
import 'package:travelplanner/components/roadtripcard.dart';

import '../components/imagecard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => HomePageState();

}

class HomePageState extends State<HomePage> {

  List<Map<String, String>> items = [
    {"image": "https://images.saymedia-content.com/.image/c_limit%2Ccs_srgb%2Cq_auto:eco%2Cw_700/MTk2NzY3MjA5ODc0MjY5ODI2/top-10-cutest-cat-photos-of-all-time.webp", "label": "non"},
    {"image": "https://images.saymedia-content.com/.image/c_limit%2Ccs_srgb%2Cq_auto:eco%2Cw_700/MTk2NzY3MjA5ODc0MjY5ODI2/top-10-cutest-cat-photos-of-all-time.webp", "label": "a"},
    {"image": "https://images.saymedia-content.com/.image/c_limit%2Ccs_srgb%2Cq_auto:eco%2Cw_700/MTk2NzY3MjA5ODc0MjY5ODI2/top-10-cutest-cat-photos-of-all-time.webp", "label": "g"},
  ];
  int currentIndex = 0;
  List<RoadTripCard> roadTripCards = [
    RoadTripCard(name: "test", startDate: DateTime.now(), endDate: DateTime.now(), departure: "paris", arrival: "bobigny", destCnt: 5),
    RoadTripCard(name: "test", startDate: DateTime.now(), endDate: DateTime.now(), departure: "paris", arrival: "bobigny", destCnt: 5),
    RoadTripCard(name: "test", startDate: DateTime.now(), endDate: DateTime.now(), departure: "paris", arrival: "bobigny", destCnt: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const NavBar(),
        body:SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(15, 15 ,0 , 0),
          child: DefaultTextStyle(
              style: Theme.of(context).textTheme.displaySmall!.merge(const TextStyle(fontSize: 25)),
              child: const Text("Top destinations")),
        ),
        CarouselSlider(
          items: items.map((item) => SizedBox(width: 170, child: ImageCard.from(item["label"]!, item["image"]!))).toList(),
          options: CarouselOptions(
            height: 220,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            }
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 15 ,0 , 0),
          child: DefaultTextStyle(
              style: Theme.of(context).textTheme.displaySmall!.merge(const TextStyle(fontSize: 25)),
              child: const Text("My travels")),
        ),
        Center(child: Column(
          children: roadTripCards,
        ))
      ],
      )
    ));
  }

}