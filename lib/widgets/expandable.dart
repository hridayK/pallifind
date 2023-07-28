import 'package:flutter/material.dart';

class ExpandableWidget extends StatefulWidget {
  final String title;
  final Widget content;

  ExpandableWidget({required this.title, required this.content});

  @override
  _ExpandableWidgetState createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Row(
                children: [
                  Icon(
                    isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
                    size: 30,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: widget.content,
          ),
      ],
    );
  }
}
