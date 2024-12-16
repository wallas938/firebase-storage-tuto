import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage_tuto/feature/authentication/data/provider/firebase.authentication.provider.dart';
import 'package:firebase_storage_tuto/feature/authentication/domain/bloc/authentication_bloc.dart';
import 'package:firebase_storage_tuto/feature/authentication/ui/page/authentication.page.dart';
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
        providers: [BlocProvider(create: (context) => AuthenticationBloc())],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AuthenticationPage(),
        ),
      ),
    );
  }
}
