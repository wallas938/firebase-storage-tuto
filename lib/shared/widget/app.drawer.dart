import 'package:firebase_storage_tuto/feature/authentication/domain/bloc/authentication_bloc.dart';
import 'package:firebase_storage_tuto/feature/user/ui/pages/user.profile.page.dart';
import 'package:firebase_storage_tuto/shared/widget/app.drawer.tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              // logo
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                // Icon
                child: Icon(
                  Icons.person,
                  size: 80,
                ),
              ),

              const Divider(
                color: Colors.black,
              ),

              // home tile
              AppDrawerTile(
                title: "H O M E",
                icon: Icons.home,
                onTap: () => Navigator.of(context).pop(),
              ),

              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return AppDrawerTile(
                    title: "P R O F I L E",
                    icon: Icons.person,
                    onTap: () {
                      // pop menu drawer
                      GoRouter.of(context).pop();

                      if (state is LoginSuccessState) {
                        // navigate to profile page
                        GoRouter.of(context).go("/user/${state.credential.uid}");
                      }
                    },
                  );
                },
              ),
              const Spacer(),

              AppDrawerTile(
                title: "L O G O U T",
                icon: Icons.logout,
                onTap: () {
                  // authCubit.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
