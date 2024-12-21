import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("_EventPageState");
    }
    return const Center(
      child: Text("E V E N T S  P A G E"),
    );
  }
}
