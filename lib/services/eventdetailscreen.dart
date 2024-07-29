import 'package:event_app/models/event.dart';
import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  EventDetailScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(event.image),
            SizedBox(height: 8.0),
            Text(
              event.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(event.description),
            SizedBox(height: 8.0),
            Text('Date: ${event.date.toLocal()}'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: event.isExpired
                  ? null
                  : () {
                     
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: event.isExpired ? Colors.red : Colors.blue,
              ),
              child: Text(event.isExpired ? 'Expired' : 'Register'),
            ),
          ],
        ),
      ),
    );
  }
}
