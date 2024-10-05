import 'package:flutter/material.dart';
import 'package:rick_and_morty_universe/public/services/displayable_image_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Rick ve Morty'nin dünyasını yeniden keşfet : Wubba Lubba Dub-Dub .",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 16),
          Image.asset(
            DisplayableImageService.getRandomDisplayableImage(),
            height: 420,
          ),
        ],
      )
    );
  }
}
