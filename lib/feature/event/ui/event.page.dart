import 'package:firebase_storage_tuto/feature/authentication/domain/model/authentication.model.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  final AppUserCredential credential;

  const EventPage({required this.credential, super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.credential.email),
    );
  }
}
