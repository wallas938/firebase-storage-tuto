import 'package:firebase_storage_tuto/feature/authentication/domain/bloc/authentication_bloc.dart';
import 'package:firebase_storage_tuto/feature/user/domain/bloc/user.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final class UserProfilePage extends StatefulWidget {
  final String uid;

  const UserProfilePage({super.key, required this.uid});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = context.read<UserBloc>();

    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      builder: (context, authState) {
        // if (authState is AuthenticationLoadingState) {
        //   print("AuthenticationLoadingState");
        //   return const Center(
        //     child: CircularProgressIndicator(),
        //   );
        // }

        return BlocBuilder<UserBloc, UserState>(
          builder: (context, userState) {
            if (userState is UserInitialState) {
              userBloc.add(FetchUserEvent(id: widget.uid));
            }

            if (userState is UserFetchedState) {
              return Scaffold(
                appBar: PreferredSize(
                  preferredSize: const Size(double.infinity, 80),
                  child: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.redAccent,
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: GestureDetector(
                          onTap: () => GoRouter.of(context).go("/events"),
                          child: const Icon(Icons.arrow_back)),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text("W E L C O M E  ${userState.user.uid}"),
                    ),
                    actions: [
                      // upload new post button
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
                body: const Center(
                  child: Text("U S E R  P R O F I L E"),
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
      listener: (BuildContext context, AuthenticationState state) {
        if (state is LoginSuccessState) {
          userBloc.add(FetchUserEvent(id: widget.uid));
        }
      },
      // listener: (BuildContext context, UserState state) {
      //   if (state is UserInitialState) {
      //     userBloc.add(FetchUserEvent(id: widget.uid));
      //   }
      //
      //   if (state is UserFetchingFailure) {
      //     GoRouter.of(context).go("/errorPage");
      //   }
      // },
    );
  }
}
