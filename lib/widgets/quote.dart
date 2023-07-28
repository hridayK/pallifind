import 'package:flutter/material.dart';

class Quote extends StatelessWidget {
  final String quote;
  final String author;

  const Quote({super.key, required this.quote, required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: Colors.grey, width: 3)),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${this.quote}',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            '~ ${author}',
            style: TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.italic,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
