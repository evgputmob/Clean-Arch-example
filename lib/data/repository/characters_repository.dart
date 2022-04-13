import 'package:get_it/get_it.dart';
import '../models/character.dart';
import '../models/quote.dart';
import '../services/breakingbad_service.dart';

class CharactersRepository {
  final IBreakingbadService _breakingbadService =
      GetIt.I<IBreakingbadService>();

  Future<List<Character>> getAllCharacters() async {
    return await _breakingbadService.fetchAllCharacters();
  }

  Future<List<Quote>> getCharacterQuotes({required String charName}) async {
    return await _breakingbadService.fetchCharacterQuotes(charName: charName);
  }
}
