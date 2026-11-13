import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _favoriteController = TextEditingController();

  @override
  void dispose() {
    _favoriteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,

        // Tombol Dark Mode
        actions: [
          IconButton(
            onPressed: () {
              context.read<UserProvider>().toggleTheme();
            },
            tooltip: provider.isDarkMode ? 'Mode Terang' : 'Mode Gelap',
            icon: Icon(
              provider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: provider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.home,
                    size: 80,
                    color: Colors.deepPurple,
                  ),

                  const SizedBox(height: 24),

                  Text(
                    provider.user.isLoggedIn
                        ? 'Selamat datang, ${provider.user.name}!'
                        : 'Selamat datang, Tamu!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  const SizedBox(height: 12),

                  if (provider.user.isLoggedIn)
                    Text(
                      provider.user.email,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),

                  // Counter Kunjungan
                  const SizedBox(height: 20),

                  Text(
                    'Jumlah Kunjungan: ${provider.visitCount}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  // Input Favorit
                  const SizedBox(height: 24),

                  TextField(
                    controller: _favoriteController,
                    decoration: InputDecoration(
                      labelText: 'Nama Favorit',
                      hintText: 'Masukkan item favorit',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          final item = _favoriteController.text.trim();

                          if (item.isNotEmpty) {
                            context.read<UserProvider>().addFavorite(item);
                            _favoriteController.clear();
                          }
                        },
                      ),
                    ),
                    onSubmitted: (value) {
                      final item = value.trim();

                      if (item.isNotEmpty) {
                        context.read<UserProvider>().addFavorite(item);
                        _favoriteController.clear();
                      }
                    },
                  ),

                  // Daftar Favorit
                  const SizedBox(height: 20),

                  Text(
                    'Daftar Favorit',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  const SizedBox(height: 8),

                  if (provider.favorites.isEmpty)
                    const Text('Belum ada item favorit.')
                  else
                    ...provider.favorites.map(
                      (item) => ListTile(
                        leading: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        title: Text(item),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<UserProvider>().removeFavorite(item);
                          },
                        ),
                      ),
                    ),

                  // Tombol Profil
                  const SizedBox(height: 32),

                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.person),
                    label: Text(
                      provider.user.isLoggedIn
                          ? 'Lihat Profil'
                          : 'Login / Daftar',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
