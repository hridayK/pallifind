import 'package:flutter/material.dart';
import 'package:pallifind/models/facility.dart';
import 'package:pallifind/screens/facilityPage.dart';

class SearchElement extends StatelessWidget {
  const SearchElement({super.key, required this.elementData});

  final List<String> elementData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Facility facility = Facility(data: elementData);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FacilityPage(facility: facility),
          ),
        );
      },
      splashColor: Colors.blue.withOpacity(0.2),
      highlightColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 32.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    elementData[1].split(',')[0],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    elementData[1],
                    style: TextStyle(fontSize: 14.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
