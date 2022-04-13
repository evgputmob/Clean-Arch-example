part of 'characters_cubit.dart';

enum CharactersStatus { initial, loading, success, failure }

class CharactersState extends Equatable {
  final CharactersStatus status;
  final List<Character> charactersList;
  final Exception? exception;

  const CharactersState({
    this.status = CharactersStatus.initial,
    this.charactersList = const [],
    this.exception,
  });

  @override
  List<Object?> get props => [status, charactersList, exception];
}
