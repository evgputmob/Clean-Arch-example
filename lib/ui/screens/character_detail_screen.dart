import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/quotes_cubit.dart';
import '../app_theme.dart';
import '../../data/models/character.dart';
import '../widgets/character_detail_screen/character_info_line.dart';
import '../widgets/character_detail_screen/lines_divider.dart';
import '../widgets/character_detail_screen/quotes_widget.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Очищаем предыдущее и устанавливаем статус
    // "QuotesStatus.initial"
    context.read<QuotesCubit>().clearQuotes();

    return Scaffold(
      backgroundColor: AppTheme.brbaDarkGrey,
      body: Theme(
        data: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(accentColor: AppTheme.brbaDarkGrey),
        ),
        child: CustomScrollView(
          slivers: [
            buildSliverAppBar(MediaQuery.of(context).size.height * 0.8),
            buildSliverList(),
          ],
        ),
      ),
    );
  }

  Widget buildSliverAppBar(double height) {
    return SliverAppBar(
      backgroundColor: AppTheme.brbaOrange,
      elevation: 0,
      // stretch: true,
      pinned: true,
      expandedHeight: height,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.nickname,
          style: const TextStyle(color: AppTheme.brbaLightGrey),
        ),
        background: Hero(
          tag: character.charId,
          child: CachedNetworkImage(
            imageUrl: character.image,
            fit: BoxFit.cover,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          ),
        ),
      ),
    );
  }

  Widget buildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CharacterInfoLine(
                  title: 'Job: ',
                  value: character.occupation.join(" / "),
                ),
                const LinesDivider(width: 200),
                CharacterInfoLine(
                  title: 'Appered In: ',
                  value: character.category,
                ),
                const LinesDivider(width: 260),
                if (character.appearance.isNotEmpty) ...[
                  CharacterInfoLine(
                    title: 'Breaking Bad Seasons: ',
                    value: character.appearance.join(" / "),
                  ),
                  const LinesDivider(width: 240),
                ],
                if (character.betterCallSaulAppearance.isNotEmpty) ...[
                  CharacterInfoLine(
                    title: 'Better Call Saul Seasons: ',
                    value: character.betterCallSaulAppearance.join(" / "),
                  ),
                  const LinesDivider(width: 250),
                ],
                CharacterInfoLine(
                  title: 'Status: ',
                  value: character.status,
                ),
                const LinesDivider(width: 220),
                CharacterInfoLine(
                  title: 'Actor/Actress: ',
                  value: character.portrayed,
                ),
                const LinesDivider(width: 240),
                const SizedBox(height: 20),
                QuotesWidget(charName: character.name)
              ],
            ),
          ),
          const SizedBox(height: 200),
        ],
      ),
    );
  }
}
