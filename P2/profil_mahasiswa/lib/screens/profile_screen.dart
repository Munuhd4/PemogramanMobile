import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import '../widgets/social_media_row.dart';
import '../widgets/action_buttons.dart';
import 'about_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Konten utama menggunakan Expanded
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Widget ProfileHeader
                    const ProfileHeader(
                      name: 'Muchammad Nurul Huda',
                      nim: '25.11.6305',
                      programStudi: 'S1 Informatika',
                      email: 'm.nurul@students.amikom.ac.id',
                      lokasi: 'Yogyakarta, Indonesia',
                    ),

                    // Widget SocialMediaRow
                    const SocialMediaRow(),

                    // Tombol navigasi AboutScreen
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutScreen(),
                          ),
                        );
                      },
                      child: const Text('Tentang Aplikasi'),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),

          // Widget ActionButtons menggunakan Flexible
          const Flexible(
            flex: 1,
            child: ActionButtons(),
          ),
        ],
      ),
    );
  }
}
