import 'package:firebase_storage_tuto/feature/authentication/domain/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state.lastEvent == AuthenticationEventType.signupSucceedEvent ||
            state.lastEvent == AuthenticationEventType.loginSucceedEvent) {
          return Center(
            child: Text(state.name),
          );
        } else {
          return Container(child: Text(state.name),);
        }
      },
    );
  }
}
