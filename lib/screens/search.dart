import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pallifind/models/SearchElement.dart';
import 'package:pallifind/screens/close_facilities.dart';
import 'package:pallifind/services/nearNodes.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<String>> _facilityData = [[]];
  List<List<String>> _searchResults = [[]];

  TextEditingController _searchTextController = TextEditingController();
  Position position = Position(
    longitude: 0,
    latitude: 0,
    timestamp: DateTime.now(),
    accuracy: 0,
    altitude: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
  );

  void latLong() async {
    setState(() async {
      position = await getCurrentLocation();
    });
  }

  @override
  void initState() {
    setState(() {
      _searchTextController.text = "Search";
    });
    _searchValues("");
    latLong();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(12.0),
          child: TextField(
            controller: _searchTextController,
            onChanged: (value) {
              _searchValues(value);
            },
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NearestFacilitiesView(
                    facilitiyData: _facilityData,
                    position: position,
                  ),
                ),
              );
            },
            child: const Text("Get Nearest Facilities"),
          ),
        ),
        Column(
          children: [
            FutureBuilder(
              future: _listFacilities(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.builder(
                      itemCount:
                          _searchResults.length < 1 ? 1 : _searchResults.length,
                      itemBuilder: (context, index) {
                        if (_searchResults.length > 0) {
                          return SearchElement(
                            elementData: _searchResults[index],
                          );
                        } else {
                          return const Center(
                            child: Text(""),
                          );
                        }
                      },
                    ),
                  );
                }
                return Center(
                  child: const CircularProgressIndicator(),
                );
              },
            ),
          ],
        )
      ],
    );
  }

  void _searchValues(String value) {
    _searchResults.clear();

    if (value.isEmpty) {
      setState(() {});
      return;
    } else {
      _facilityData.forEach((element) {
        if (element[1].toLowerCase().contains(value.toLowerCase())) {
          _searchResults.add(element);
        }
        setState(() {});
      });
    }
    setState(() {});
  }

  Future<List<List<String>>> _listFacilities() async {
    String readResult = "hag diya!";
    List<List<String>> parsedResults = [[]];
    try {
      readResult = await rootBundle.loadString('assets/facility_data.csv').then(
            (value) => value,
          );
      parsedResults = await CsvToListConverter(shouldParseNumbers: false)
          .convert(readResult);
      for (int i = 0; i < parsedResults.length; i++) {
        if (parsedResults[i][3].trim() == '') {
          parsedResults[i][3] = "empty";
          setState(() {});
        }
      }
    } catch (error) {
      print(error);
    }
    setState(() {
      _facilityData = parsedResults;
    });
    return parsedResults;
  }
}
