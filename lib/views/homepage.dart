import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travelplanner/components/navbar.dart';
import 'package:travelplanner/components/roadtripcard.dart';
import 'package:travelplanner/main.dart';
import 'package:travelplanner/models/travel.dart';

import '../components/imagecard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();

}

class HomePageState extends State<HomePage> {
  List<RoadTripCard> roadTripCards = [];

  Future<List<RoadTripCard>> fetchTravels() async {
    List<RoadTripCard> tmp = [];

    for (Travel travel in await Travel.getTravels(MyApp.user!.user!.uid)) {
      tmp.add(RoadTripCard(
        arrival: travel.arrival,
        departure: travel.departure,
        destCnt: 1,
        endDate: DateTime.fromMillisecondsSinceEpoch(int.tryParse(travel.end_date) ?? 0),
        name: travel.title,
        startDate: DateTime.fromMillisecondsSinceEpoch(int.tryParse(travel.start_date) ?? 0),
        id: travel.id,
      ));
    }
    return tmp;
  }

  @override
  void initState() {
    super.initState();
    fetchTravels().then((value) => setState(() {
      roadTripCards = value;
    }));
  }

  List<Map<String, String>> items = [
    {"image": "https://images.unsplash.com/photo-1564594736624-def7a10ab047?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80", "label": "Paris"},
    {"image": "https://media.istockphoto.com/id/1170755953/fr/photo/les-rives-du-rh%C3%B4ne-%C3%A0-lyon.jpg?s=1024x1024&w=is&k=20&c=u1BenQEoukcqlUda86D8OUujzm9PBxTj-OUg5IW283E=", "label": "La Guillotière"},
    {"image": "https://media.istockphoto.com/id/1438614382/fr/photo/plan-vertical-dun-parc-avec-des-b%C3%A2timents-en-b%C3%A9ton-%C3%A0-roubaix-france.jpg?s=2048x2048&w=is&k=20&c=6JRuIDQiPZH0QewxN3hF0eUw5XPWhlk3ZUHlotuxqR8=", "label": "Roubaix"},
  ];
  int currentIndex = 0;

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