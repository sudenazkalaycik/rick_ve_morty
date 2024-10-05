import 'package:flutter/cupertino.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Hay Aksi!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32
            )
          ),
          const SizedBox(height: 16),
          Image.asset("assets/404.png"),
          const SizedBox(height: 16),
          const Text(
            "404 knk bulamadık",
            textAlign: TextAlign.center,
          ),
        ],
      )
    );
  }
}
