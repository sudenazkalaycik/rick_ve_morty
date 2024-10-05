import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Google Fonts'u ekle

import 'package:rick_and_morty_universe/character_hub/screens/favorite_characters_page.dart';
import 'package:rick_and_morty_universe/character_hub/screens/search_character_page.dart';
import 'package:rick_and_morty_universe/navigation/models/enumeration/app_route.dart';
import 'package:rick_and_morty_universe/public/screens/home_screen.dart';
import 'package:rick_and_morty_universe/public/screens/not_found_screen.dart';
import 'package:rick_and_morty_universe/navigation/widgets/enhanced_bottom_navigation_bar.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  Widget view = const HomeScreen();

  void navigateTo(AppRoute route) {
    setState(() {
      switch(route) {
        case AppRoute.home: view = const HomeScreen();
        case AppRoute.notFound: view = const NotFoundScreen();
        case AppRoute.favoriteCharacters: view = const FavoriteCharactersPage();
        case AppRoute.characterSearch: view = const SearchCharacterPage();
        default: view = const NotFoundScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: view,
      appBar: AppBar(
        title: Text(
          "Rick and Morty'nin Dünyası",
          style: GoogleFonts.lobster( // Google Font kullanarak yazıyı güncelle
            fontWeight: FontWeight.bold,
            fontSize: 24, // Yazı tipi boyutunu ayarla
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      bottomNavigationBar: EnhancedBottomNavigationBar(navigateTo: navigateTo),
    );
  }
}
