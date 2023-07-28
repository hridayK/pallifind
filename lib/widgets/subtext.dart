import 'package:flutter/material.dart';

class Subtext extends StatelessWidget {
  final String subtext;

  Subtext({required this.subtext});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        subtext,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
