// https://app.quicktype.io/?l=dart

import 'dart:convert';

class Quote {
  Quote({
    required this.quoteId,
    required this.quote,
    required this.author,
    required this.series,
  });

  final int quoteId;
  final String quote;
  final String author;
  final String series;

  factory Quote.fromRawJson(String str) => Quote.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        quoteId: json["quote_id"],
        quote: json["quote"],
        author: json["author"],
        series: json["series"],
      );

  Map<String, dynamic> toJson() => {
        "quote_id": quoteId,
        "quote": quote,
        "author": author,
        "series": series,
      };

  Quote copyWith({
    int? quoteId,
    String? quote,
    String? author,
    String? series,
  }) =>
      Quote(
        quoteId: quoteId ?? this.quoteId,
        quote: quote ?? this.quote,
        author: author ?? this.author,
        series: series ?? this.series,
      );
}
