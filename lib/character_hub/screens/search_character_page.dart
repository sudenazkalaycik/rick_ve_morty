import 'package:flutter/material.dart';
import 'package:rick_and_morty_universe/character_hub/models/character.dart';
import 'package:rick_and_morty_universe/character_hub/services/CharacterService.dart';
import 'package:rick_and_morty_universe/character_hub/widgets/character_list_container.dart';
import 'package:rick_and_morty_universe/character_hub/widgets/informative/searching_message.dart';

class SearchCharacterPage extends StatefulWidget {
  const SearchCharacterPage({super.key});

  @override
  State<SearchCharacterPage> createState() => _SearchCharacterPageState();
}

class _SearchCharacterPageState extends State<SearchCharacterPage> {
  final TextEditingController searchTermController = TextEditingController();
  CharacterService characterService = CharacterService();
  List<Character>? _characters;
  bool isSearching = false;

  void onSearch(String name) async {
    setState(() {
      isSearching = true;
    });
    _characters = await characterService.getByName(name);
    setState(() {
      _characters = _characters;
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: const Offset(0, 4), // Gölge konumu
                ),
              ],
            ),
            child: TextField(
              controller: searchTermController,
              decoration: InputDecoration(
                hintText: "Karakter Ara",
                hintStyle: TextStyle(color: Colors.grey[600]), // Hints rengi
                prefixIcon: Icon(Icons.search, color: Colors.indigo), // Arama ikonu rengi
                border: InputBorder.none, // Kenar çizgisi yok
                contentPadding: const EdgeInsets.all(16), // İçerik yastığı
              ),
              onSubmitted: onSearch,
            ),
          ),
        ),
        Expanded(
          child: isSearching
              ? const SearchingMessage()
              : CharacterListContainer(characters: _characters),
        ),
      ],
    );
  }

  @override
  void dispose() {
    searchTermController.dispose();
    super.dispose();
  }
}
