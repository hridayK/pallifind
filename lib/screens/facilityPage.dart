import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:pallifind/models/facility.dart';
import 'package:url_launcher/url_launcher.dart';

class FacilityPage extends StatelessWidget {
  const FacilityPage({super.key, required this.facility});

  final Facility facility;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(facility.name ?? "Facility"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Name:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SelectableText(
                facility.name ?? "N/A",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              const Text(
                "Address:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SelectableText(
                facility.address ?? "N/A",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              const Text(
                "Details:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              SelectableText(
                facility.contactDetails ?? "N/A",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 14.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.98,
                child: ElevatedButton(
                  onPressed: () async {
                    String search = facility.name ?? "N/A";
                    search = search.trim().replaceAll('&', 'and');
                    print(search);
                    final Uri uri =
                        Uri.parse("https://www.google.com/search?q=$search");
                    if (search != "N/A") {
                      try {
                        await launchUrl(uri);
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Cannot launch browser"),
                          ),
                        );
                        print(error);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Error Loading more information"),
                        ),
                      );
                    }
                  },
                  child: const Text("View More"),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.98,
                child: ElevatedButton(
                  onPressed: () async {
                    final availableMaps = await MapLauncher.installedMaps;
                    if (availableMaps.length > 0) {
                      await availableMaps.first.showMarker(
                        coords: Coords(facility.latitude!, facility.longitude!),
                        title: facility.name!,
                        description: facility.name!,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "You do not have any map applications install on your device"),
                        ),
                      );
                    }
                  },
                  child: const Text("Open in Maps"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
