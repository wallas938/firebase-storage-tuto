import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage_tuto/feature/authentication/data/provider/firebase.authentication.provider.dart';
import 'package:firebase_storage_tuto/feature/authentication/domain/bloc/authentication_bloc.dart';
import 'package:firebase_storage_tuto/feature/routing/router.dart';
import 'package:firebase_storage_tuto/feature/user/data/provider/firebase.app.user.provider.dart';
import 'package:firebase_storage_tuto/feature/user/domain/bloc/user.bloc.dart';
import 'package:firebase_storage_tuto/feature/user/domain/repository/user.repository.implementation.dart';
import 'package:firebase_storage_tuto/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:url_strategy/url_strategy.dart';

import 'feature/authentication/domain/repository/authentication.repository.implementation.dart';

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GetIt.instance.registerLazySingleton(() => FirebaseAuthenticationProvider());
  GetIt.instance.registerLazySingleton(() => FirebaseAppUserProvider());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthenticationRepositoryImpl()),
        RepositoryProvider(create: (context) => UserRepositoryImpl()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthenticationBloc(
                  context.read<AuthenticationRepositoryImpl>())
                ..add(const CheckAuthenticationEvent())
          ),
          BlocProvider(
              create: (context) => UserBloc(context.read<UserRepositoryImpl>()))
        ],
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, authState) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: routes,
          ),
        ),
      ),
    );
  }
}
