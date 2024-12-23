import 'package:firebase_storage_tuto/feature/user/domain/bloc/user.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditUserProfilePage extends StatefulWidget {
  final String uid;

  const EditUserProfilePage({super.key, required this.uid});

  @override
  State<EditUserProfilePage> createState() => _EditUserProfilePageState();
}

class _EditUserProfilePageState extends State<EditUserProfilePage> {

  late TextEditingController emailController;
  late TextEditingController bioController;
  late TextEditingController phoneController;
  late TextEditingController locationController;
  late TextEditingController twitterController;
  late TextEditingController instagramController;

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    emailController.dispose();
    bioController.dispose();
    phoneController.dispose();
    locationController.dispose();
    twitterController.dispose();
    instagramController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<UserBloc, UserState>(
      listener: (context, userState) {
        // TODO: implement listener
      },
      builder: (context, userState) {
        if (userState is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (userState is UserFetchedState) {
          emailController = TextEditingController(text: userState.user.email);
          bioController = TextEditingController(text: userState.user.bio);
          phoneController = TextEditingController(text: userState.user.phone);
          locationController = TextEditingController(text: userState.user.location);
          twitterController = TextEditingController(text: userState.user.socialLinks?.twitter);
          instagramController = TextEditingController(text: userState.user.socialLinks?.instagram);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Edit Profile'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: () {
                    // Save logic here
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextField('Email', emailController),
                  buildTextField('Bio', bioController, maxLines: 3),
                  buildTextField('Phone', phoneController),
                  buildTextField('Location', locationController),
                  const Divider(),
                  const Text('Social Links', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  buildTextField('Twitter', twitterController),
                  buildTextField('Instagram', instagramController),
                ],
              ),
            ),
          );
        }
        return const Placeholder();
      },
    );
  }
}

Widget buildTextField(String label, TextEditingController controller, {int maxLines = 1}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  );
}
