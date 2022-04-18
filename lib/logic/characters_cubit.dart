import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/models/character.dart';
import '../data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository _charactersRepository;

  CharactersCubit({required CharactersRepository charactersRepository})
      : _charactersRepository = charactersRepository,
        super(const CharactersState());

  List<Character> _charsList = [];

  // getAllCharacters
  Future<void> getAllCharacters() async {
    emit(const CharactersState(status: CharactersStatus.loading));
    try {
      _charsList = await _charactersRepository.getAllCharacters();
      emit(CharactersState(
          status: CharactersStatus.success, charactersList: _charsList));
    } catch (e) {
      emit(CharactersState(
          status: CharactersStatus.failure, exception: e.toString()));
    }
  }

  // getFilteredCharacters
  void getFilteredCharacters(String searchStr) {
    final List<Character> chList = (searchStr.isNotEmpty)
        ? _charsList
            .where((ch) => ch.name.toLowerCase().contains(searchStr))
            .toList()
        : _charsList;

    emit(CharactersState(
        status: CharactersStatus.success, charactersList: chList));
  }

  // getAllCharacters
  Future<void> tryGetAllCharactersAgain() async {
    _charsList = [];
    getAllCharacters();
  }
}
