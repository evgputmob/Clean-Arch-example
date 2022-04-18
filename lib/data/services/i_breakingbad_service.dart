import '../models/character.dart';
import '../models/quote.dart';

abstract class IBreakingbadService {
  Future<List<Character>> fetchAllCharacters();
  Future<List<Quote>> fetchCharacterQuotes({required String charName});
}
