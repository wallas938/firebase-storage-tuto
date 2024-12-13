import 'package:firebase_storage_tuto/feature/authentication/ui/page/login.page.dart';
import 'package:firebase_storage_tuto/feature/authentication/ui/page/signup.page.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool isUserLogged = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isUserLogged ? const LoginPage() : const SignUpPage(),
    );
  }
}
