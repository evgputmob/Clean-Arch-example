import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/quotes_cubit.dart';

class QuotesWidget extends StatelessWidget {
  final String charName;

  const QuotesWidget({Key? key, required this.charName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quotesState = context.watch<QuotesCubit>().state;

    switch (quotesState.status) {
      //---
      case QuotesStatus.initial:
        context.read<QuotesCubit>().getCharacterQuotes(charName: charName);
        return const SizedBox.shrink();
      //---
      case QuotesStatus.loading:
        return const Center(child: CircularProgressIndicator());
      //---
      case QuotesStatus.failure:
        return const Center(child: Text('Something went wrong'));
      //---
      case QuotesStatus.success:
    }

    final quotes = quotesState.quotesList;
    if (quotes.isEmpty) return const SizedBox.shrink();

    quotes.shuffle();

    return SizedBox(
      width: double.infinity,
      height: 300,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 23,
          fontStyle: FontStyle.italic,
        ),
        child: AnimatedTextKit(
          pause: const Duration(seconds: 3),
          repeatForever: true,
          animatedTexts: [
            for (var qoute in quotes)
              TypewriterAnimatedText(
                qoute.quote,
                speed: const Duration(milliseconds: 40),
              )
          ],
        ),
      ),
    );
  }
}
