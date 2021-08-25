import '../models/character.dart';
import '../models/quote.dart';
import '../web_services/characters_web_serveces.dart';

class CharactersRepository {
  final CharactersWebServieces charactersWebServieces;

  CharactersRepository(this.charactersWebServieces);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServieces.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }

  Future<List<Quote>> getCharacterQuotes(String charName) async {
    final quotes = await charactersWebServieces.getCharacterQuotes(charName);
    return quotes.map((qoute) => Quote.fromJson(qoute)).toList();
  }
}
