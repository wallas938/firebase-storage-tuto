import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage_tuto/feature/authentication/data/provider/firebase.authentication.provider.dart';
import 'package:firebase_storage_tuto/feature/authentication/domain/bloc/authentication_bloc.dart';
import 'package:firebase_storage_tuto/feature/authentication/ui/page/authentication.page.dart';
import 'package:firebase_storage_tuto/feature/user/data/provider/firebase.app.user.provider.dart';
import 'package:firebase_storage_tuto/feature/user/domain/bloc/user.bloc.dart';
import 'package:firebase_storage_tuto/feature/user/domain/repository/user.repository.implementation.dart';
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
                ..add(const CheckAuthenticationEvent())),
          BlocProvider(
              create: (context) => UserBloc(context.read<UserRepositoryImpl>()))
        ],
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, authState) => MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: const {},
              home: Scaffold(
                body: BlocBuilder<UserBloc, UserState>(
                  builder: (context, userState) {
                    return const AuthenticationPage();
                    // authenticated -> home page
                    // if (userState is UserFetchedState) {
                    //   return EventPage(
                    //     user: userState.user,
                    //   );
                    // }
                    //
                    // // unauthenticated -> auth page (login/register)
                    // if (authState is AuthenticationInitialState) {
                    //   return const AuthenticationPage();
                    // }
                    // return const Center(
                    //   child: CircularProgressIndicator(),
                    // );
                  },
                ),
              )),
        ),
      ),
    );
  }
}
