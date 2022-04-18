import '../../=models=/character.dart';
import '../../=models=/quote.dart';
import '../services/i_breakingbad_service.dart';

class CharactersRepository {
  final IBreakingbadService _breakingbadService;

  CharactersRepository({required IBreakingbadService breakingbadService})
      : _breakingbadService = breakingbadService;

  Future<List<Character>> getAllCharacters() async {
    return await _breakingbadService.fetchAllCharacters();
  }

  Future<List<Quote>> getCharacterQuotes({required String charName}) async {
    return await _breakingbadService.fetchCharacterQuotes(charName: charName);
  }
}
