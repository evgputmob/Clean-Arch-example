import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../=models=/quote.dart';
import '../data/repository/characters_repository.dart';

part 'quotes_state.dart';

class QuotesCubit extends Cubit<QuotesState> {
  final CharactersRepository _charactersRepository;

  QuotesCubit({required CharactersRepository charactersRepository})
      : _charactersRepository = charactersRepository,
        super(const QuotesState());

  List<Quote> _quotes = [];

  // getCharacterQuotes
  Future<void> getCharacterQuotes({required String charName}) async {
    emit(const QuotesState(status: QuotesStatus.loading));
    try {
      _quotes =
          await _charactersRepository.getCharacterQuotes(charName: charName);
      emit(QuotesState(status: QuotesStatus.success, quotesList: _quotes));
    } catch (e) {
      emit(QuotesState(status: QuotesStatus.failure, exception: e.toString()));
    }
  }

  // clearQuotes
  void clearQuotes() {
    _quotes = [];
    emit(const QuotesState(status: QuotesStatus.initial));
  }
}
