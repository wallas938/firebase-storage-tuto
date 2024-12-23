import 'package:firebase_storage_tuto/shared/widget/app.drawer.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("H O M E"),
        actions: [
          // upload new post button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ), // IconButton
        ],
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("E V E N T S  P A G E"),
      ),
    );
  }
}
