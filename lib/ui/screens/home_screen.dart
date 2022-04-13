import '../app_theme.dart';
import 'package:flutter/material.dart';
import '../widgets/home_screen/char_list_title.dart';
import '../widgets/home_screen/characters_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const CharListTitle(),
        backgroundColor: AppTheme.brbaOrange,
      ),
      body: const CharactersContent(),
    );
  }
}
