import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Google Fonts için ekleme

class NoFavoriteCharactersMessage extends StatelessWidget {
  const NoFavoriteCharactersMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Arka plan rengi
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Favori ikonunu ve stilini güncelle
              Icon(
                Icons.heart_broken_rounded,
                size: 124,
                color: Colors.indigo // İkon rengi
              ),
              const SizedBox(height: 24), // İkon ile metin arasında boşluk
              Text(
                "Favorilerin boş, hadi git ve keşfet,\nbeğendiklerini de favorile",
                textAlign: TextAlign.center,
                style: GoogleFonts.alata( // Farklı yazı tipi
                  fontSize: 26, // Yazı boyutu
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Yazı rengi
                ),
              ),
              const SizedBox(height: 16), // Metinler arasında boşluk
              Text(
                "Hadi yeni karakter bulalım",
                textAlign: TextAlign.center,
                style: GoogleFonts.lobster( // Farklı yazı tipi
                  fontSize: 22, // Yazı boyutu
                  color: Colors.black54, // Yazı rengi
                ),
              ),
              const SizedBox(height: 32), // Aşağıda boşluk
              ElevatedButton(
                onPressed: () {
                  // Butona tıklama fonksiyonu
                  // Buraya karakter keşfetme sayfasına yönlendirme kodunu ekleyebilirsiniz.
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Buton rengi
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Buton içi boşluk
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Kenar yuvarlama
                  ),
                ),
                child: const Text(
                  "Yeni Karakterler Keşfet",
                  style: TextStyle(
                    fontSize: 18, // Buton yazı boyutu
                    color: Colors.white, // Buton yazı rengi
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
