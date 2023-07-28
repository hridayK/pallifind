import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pallifind/models/SearchElement.dart';
import 'package:pallifind/models/facility.dart';

class NearestFacilitiesView extends StatefulWidget {
  const NearestFacilitiesView({
    super.key,
    required this.facilitiyData,
    required this.position,
  });

  final List<List<String>> facilitiyData;
  final Position position;

  @override
  State<NearestFacilitiesView> createState() => _NearestFacilitiesViewState();
}

class _NearestFacilitiesViewState extends State<NearestFacilitiesView> {
  List<Facility> facility = [];

  Future<List<Facility>> getNearest() async {
    List<Facility> facilities = [];
    print(widget.facilitiyData.length);

    widget.facilitiyData.forEach((element) {
      facilities.add(Facility(data: element));
    });

    double lat = widget.position.latitude;
    double long = widget.position.longitude;

    facilities.forEach((element) {
      element.userDistance = Geolocator.distanceBetween(
          lat, long, element.latitude!, element.longitude!);
    });

    facilities.sort(
      (a, b) => a.userDistance.compareTo(b.userDistance),
    );
    setState(() {
      facility = facilities;
    });
    return facilities;
  }

  @override
  void initState() {
    getNearest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nearest Facilties')),
      body: FutureBuilder(
        future: getNearest(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SearchElement(elementData: snapshot.data![index].data);
                },
              ),
            );
          }
          return Center(
            child: const CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
