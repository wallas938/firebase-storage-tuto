import 'package:firebase_storage_tuto/feature/user/domain/model/user.model.dart';
import 'package:firebase_storage_tuto/feature/user/ui/widget/user.info.row.dart';
import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  final AppUser user;

  const UserData({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey.shade300,
                  child:
                      Icon(Icons.person, size: 50, color: Colors.grey.shade600),
                ),
              ),
              const SizedBox(height: 16),
              UserInfoRow(label: 'UID', value: user.uid),
              UserInfoRow(label: 'Email', value: user.email),
              UserInfoRow(label: 'Bio', value: user.bio),
              UserInfoRow(
                  label: 'Created At', value: user.createdAt.toString()),
              UserInfoRow(
                  label: 'Last Login', value: user.lastLogin.toString()),
              const Divider(),
              const Text('Location Info',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              UserInfoRow(
                  label: 'Latitude',
                  value: user.coordinates?.latitude.toString()),
              UserInfoRow(
                  label: 'Longitude',
                  value: user.coordinates?.longitude.toString()),
              const Divider(),
              const Text('Social Stats',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              UserInfoRow(label: 'Followers', value: user.followers.toString()),
              UserInfoRow(label: 'Following', value: user.following.toString()),
              const Divider(),
              const Text('Notifications',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              UserInfoRow(
                  label: 'Notification Email',
                  value: user.notificationPreferences?.email.toString()),
              UserInfoRow(
                  label: 'Notification Push',
                  value: user.notificationPreferences?.push.toString()),
              const Divider(),
              const Text('Events',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              UserInfoRow(
                  label: 'Attended Events',
                  value: user.attendedEvents.toString()),
              UserInfoRow(
                  label: 'Created Events',
                  value: user.createdEvents.toString()),
              const Divider(),
              const Text('Preferences',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              UserInfoRow(
                  label: 'Event Preferences',
                  value: user.eventPreferences.toString()),
              UserInfoRow(label: 'Favorites', value: user.favorites.toString()),
              const Divider(),
              const Text('Contact Info',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              UserInfoRow(label: 'Phone', value: user.phone),
              UserInfoRow(label: 'Location', value: user.location),
              const Divider(),
              const Text('Points & Social Links',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              UserInfoRow(label: 'Points', value: user.points.toString()),
              UserInfoRow(label: 'Twitter', value: user.socialLinks?.twitter),
              UserInfoRow(
                  label: 'Instagram', value: user.socialLinks?.instagram),
            ],
          ),
        ),
      ),
    );
  }
}
