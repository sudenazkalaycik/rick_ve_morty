import 'package:flutter/material.dart';
import 'package:rick_and_morty_universe/character_hub/models/character.dart';

class CharacterDetail extends StatelessWidget {
  final Character character;

  const CharacterDetail({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView( // Scrollable yapısı ekleyelim
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30), // Yukarıdan boşluk ekledik
              Center(
                child: PhysicalModel(
                  color: Colors.transparent,
                  elevation: 8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16), // Köşeleri yuvarla
                    child: Image.network(character.image),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Boşluk ekledik
              Text(
                character.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.black87, // Metin rengi
                ),
              ),
              const SizedBox(height: 10), // Boşluk ekledik
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Chip(
                    label: Text(character.species),
                    labelStyle: const TextStyle(color: Colors.white),
                    backgroundColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16), // Yuvarlak köşeler
                    ),
                  ),
                  const SizedBox(width: 8),
                  GenderChip(gender: character.gender),
                ],
              ),
              const SizedBox(height: 20), // Boşluk ekledik
              _buildStatusInfo(character.status), // Yaşamsal fonksiyon bilgisi
              const SizedBox(height: 20), // Boşluk ekledik
              _buildLocationInfo(character.originName, character.currentLocationName), // Konum bilgisi
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        width: 140,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.indigo, // Butonun arka plan rengi
          borderRadius: BorderRadius.circular(30), // Yuvarlatılmış köşeler
          boxShadow: [
            BoxShadow(
              color: Colors.black26, // Gölge rengi
              blurRadius: 8.0, // Gölge bulanıklığı
              offset: Offset(0, 4), // Gölge pozisyonu
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // ElevatedButton'un arka plan rengini şeffaf yap
            shadowColor: Colors.transparent, // Gölgeyi kaldır
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Yuvarlatılmış köşeler
            ),
          ),
          child: const Center(
            child: Row(
              mainAxisSize: MainAxisSize.min, // Buton içindeki elemanların minimum boyutunu ayarla
              children: [
                Icon(Icons.arrow_back, color: Colors.white), // İkon rengi
                SizedBox(width: 8),
                Text(
                  'Geri Dön',
                  style: TextStyle(
                    color: Colors.white, // Yazı rengi
                    fontWeight: FontWeight.bold, // Yazı kalınlığı
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }

  // Yaşamsal Fonksiyon Bilgisi
  Widget _buildStatusInfo(String status) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Yaşamsal Fonksiyon: ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          Text(
            status,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: status == "Alive"
                  ? Colors.green
                  : status == "Dead"
                  ? Colors.red
                  : Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  // Konum Bilgisi
  Widget _buildLocationInfo(String originName, String currentLocationName) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on),
              const SizedBox(width: 4),
              const Text(
                "Konum Bilgisi",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Chip(
            label: Text("Başlangıç: $originName"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 8),
          Chip(
            label: Text("Gerçeklik: $currentLocationName"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ],
      ),
    );
  }
}

class GenderChip extends StatelessWidget {
  final String gender;
  const GenderChip({super.key, required this.gender});

  @override
  Widget build(BuildContext context) {
    Color genderColor = Colors.yellow;
    Icon genderIcon = const Icon(Icons.question_mark);

    if (gender == "Male") {
      genderColor = Colors.blue;
      genderIcon = const Icon(Icons.male, color: Colors.white);
    } else if (gender == "Human") {
      genderColor = Colors.pink;
      genderIcon = const Icon(Icons.female, color: Colors.white);
    }

    return Chip(
      label: Text(gender),
      avatar: genderIcon,
      labelStyle: const TextStyle(color: Colors.white),
      backgroundColor: genderColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Yuvarlak köşeler
      ),
      side: const BorderSide(color: Colors.transparent),
    );
  }
}
