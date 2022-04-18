part of 'quotes_cubit.dart';

enum QuotesStatus { initial, loading, success, failure }

class QuotesState extends Equatable {
  final QuotesStatus status;
  final List<Quote> quotesList;
  final String? exception;

  const QuotesState({
    this.status = QuotesStatus.initial,
    this.quotesList = const [],
    this.exception,
  });

  @override
  List<Object?> get props => [status, quotesList, exception];
}
