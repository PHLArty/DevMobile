import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final String username;
  final String email;

  const UserInfoWidget({
    super.key,
    required this.username,
    required this.email
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Username: $username',
        style: const TextStyle(fontSize: 20),
        ),
        Text('email: ${email}',
        style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}

// Create screen
class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile user'),),
      body: const Center(
        child: UserProfileAddName(UserInfoWidget: UserInfoWidget(
            username: 'longit15',
            email: 'long151103@gmail.com',
          ), name: 'Phan Huu Long'),
      ),
    );
  }
}


// Create add name
class UserProfileAddName extends StatelessWidget {
  final String name;
  const UserProfileAddName({super.key, required UserInfoWidget,required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UserInfoWidget(username: 'longit15', email: 'long151103@gmail.com'),
        Text('Name: ${name}'),
      ],
    );
  }
  
}