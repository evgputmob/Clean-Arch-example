import 'package:flutter/material.dart';
import '../../app_theme.dart';

class CharacterInfoLine extends StatelessWidget {
  final String title;
  final String value;

  const CharacterInfoLine({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: AppTheme.brbaLightGrey,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
