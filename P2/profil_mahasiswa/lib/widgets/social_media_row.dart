import 'package:flutter/material.dart';

class SocialMediaRow extends StatelessWidget {
  const SocialMediaRow({super.key});

  void _showMessage(BuildContext context, String platform) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Membuka $platform'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.camera_alt),
          onPressed: () {
            _showMessage(context, 'Instagram');
          },
        ),
        IconButton(
          icon: const Icon(Icons.work),
          onPressed: () {
            _showMessage(context, 'LinkedIn');
          },
        ),
        IconButton(
          icon: const Icon(Icons.code),
          onPressed: () {
            _showMessage(context, 'GitHub');
          },
        ),
      ],
    );
  }
}
