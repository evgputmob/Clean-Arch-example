import '../breakingbad_service.dart';
import '../../models/character.dart';
import '../../models/quote.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BreakingbadService implements IBreakingbadService {
  static const baseUrl = 'https://www.breakingbadapi.com/api';

  @override
  Future<List<Character>> fetchAllCharacters() async {
    Future.delayed(const Duration(seconds: 2));
    final response = await http.get(Uri.parse('$baseUrl/characters'));
    final charsArray = jsonDecode(response.body) as List<dynamic>;
    return charsArray
        .map((character) => Character.fromJson(character))
        .toList();
  }

  @override
  Future<List<Quote>> fetchCharacterQuotes({required String charName}) async {
    final quoteAuthor = charName.replaceAll(' ', '+');
    final url =
        Uri.parse('$baseUrl/quote').replace(query: 'author=$quoteAuthor');
    final response = await http.get(url);
    final quotesArray = jsonDecode(response.body) as List<dynamic>;
    return quotesArray.map((quote) => Quote.fromJson(quote)).toList();
  }
}
