import '../../app_theme.dart';
import '../../../data/models/character.dart';
import '../../screens/character_detail_screen.dart';
import 'package:flutter/material.dart';

class CharacterGridItem extends StatelessWidget {
  final Character character;
  final EdgeInsets itemMargins;

  const CharacterGridItem(
      {Key? key, required this.character, required this.itemMargins})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: itemMargins,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CharacterDetailScreen(character: character),
          ));
        },
        child: GridTile(
          child: Hero(
            tag: character.charId,
            child: Container(
              color: AppTheme.brbaDarkGrey,
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/images/loading.gif',
                      image: character.image,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/placeholder.png'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              character.name,
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                color: AppTheme.brbaLightGrey,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
