import 'package:flutter/material.dart';
import 'package:travelplanner/models/travel.dart';

import 'destination_page/destination_details.dart';
import 'models/destination.dart';

class TravelListScreen extends StatefulWidget {
  @override
  _TravelListScreenState createState() => _TravelListScreenState();
}

class _TravelListScreenState extends State<TravelListScreen> {
  List<Travel> travelList = [];

  @override
  void initState() {
    super.initState();
    fetchTravelList();
  }

  Future<void> fetchTravelList() async {
    List<Travel> travels = await Travel.getTravels("0");
    setState(() {
      travelList = travels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des travels'),
      ),
      body: travelList.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: travelList.length,
        itemBuilder: (BuildContext context, int index) {
          Travel travel = travelList[index];
          return ListTile(
            title: Text(travel.title),
            subtitle: Text(travel.departure),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DestinationsPage(travel: travel),
                ),
              );
            },
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                deleteTravel(travel);
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> deleteTravel(Travel travel) async {
    await travel.deleteTravel();
    fetchTravelList();
  }
}

class DestinationsPage extends StatelessWidget {
  final Travel travel;

  DestinationsPage({required this.travel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dest*inations du voyage'),
      ),
      body: FutureBuilder<List<Destination>>(
        future: Destination.getDestinations(travel.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Une erreur s\'est produite.'),
            );
          } else if (snapshot.hasData) {
            List<Destination> destinationList = snapshot.data!;
            return ListView.builder(
              itemCount: destinationList.length,
              itemBuilder: (context, index) {
                Destination destination = destinationList[index];
                return ListTile(
                  title: Text(destination.city),
                  subtitle: Text(destination.comment),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DestinationDetails(destination: destination,),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: Text('Aucune destination trouvée.'),
            );
          }
        },
      ),
    );
  }
}
