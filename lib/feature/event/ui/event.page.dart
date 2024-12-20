import 'package:firebase_storage_tuto/feature/user/domain/model/user.model.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  final AppUser user;

  const EventPage({required this.user, super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    print("_EventPageState");
    return Center(
      child: Text(widget.user.email),
    );
  }
}
