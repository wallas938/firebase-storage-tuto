import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage_tuto/feature/authentication/data/provider/firebase.authentication.provider.dart';
import 'package:firebase_storage_tuto/feature/authentication/domain/bloc/authentication_bloc.dart';
import 'package:firebase_storage_tuto/feature/authentication/ui/page/authentication.page.dart';
import 'package:firebase_storage_tuto/feature/event/ui/event.page.dart';
import 'package:firebase_storage_tuto/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'feature/authentication/domain/repository/authentication.repository.implementation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GetIt.instance.registerLazySingleton(() => FirebaseAuthenticationProvider());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthenticationRepositoryImpl()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthenticationBloc(
                  context.read<AuthenticationRepositoryImpl>())
                ..add(const AuthenticationCheckEvent()))
        ],
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: BlocConsumer<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                // unauthenticated -> auth page (login/register)
                if (state.lastEvent ==
                    AuthenticationEventType.authenticationInitialEvent) {
                  return const AuthenticationPage();
                }

                // authenticated -> home page
                if (state.lastEvent ==
                    AuthenticationEventType.loginSucceedEvent) {
                  return const EventPage();
                }

                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
              listener: (BuildContext context, AuthenticationState state) {},
            ),
          ),
        ),
      ),
    );
  }
}
