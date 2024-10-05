import 'package:flutter/material.dart';

class NoResultMessage extends StatelessWidget {
  const NoResultMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 124,
            color: Colors.redAccent, // İkon rengi
          ),
          const SizedBox(height: 16), // İkon ile metin arasında boşluk
          Text(
            "Sanıyorum ki bizde böyle bir bilgi yok, üzgünüm",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28, // Font boyutu
              fontWeight: FontWeight.bold,
              color: Colors.black87, // Metin rengi
              fontFamily: 'Arial', // Font ailesi
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Yeniden denemekten korkma, bir adım at ve farklı şekilde arat.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16, // Alt metin boyutu
              color: Colors.black54, // Daha hafif bir metin rengi
              fontStyle: FontStyle.italic, // İtalik stil
            ),
          ),
          const SizedBox(height: 20), // Alt metin ile aşağıdaki boşluk
          ElevatedButton(
            onPressed: () {
              // Buraya buton tıklama işlevini ekleyebilirsiniz
              print("Yeni arama yapıldı");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent, // Buton rengi
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Buton iç boşlukları
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text('Yeni Arama Yap'),
          ),
        ],
      ),
    );
  }
}
