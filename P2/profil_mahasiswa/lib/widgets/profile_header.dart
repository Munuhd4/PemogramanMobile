import 'package:flutter/material.dart';
import 'profile_photo.dart';
import 'profile_info.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String nim;
  final String programStudi;
  final String email;
  final String lokasi;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.nim,
    required this.programStudi,
    required this.email,
    required this.lokasi,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        const ProfilePhoto(radius: 60),
        const SizedBox(height: 24),
        ProfileInfo(
          name: name,
          nim: nim,
          programStudi: programStudi,
          email: email,
          lokasi: lokasi,
        ),
      ],
    );
  }
}
