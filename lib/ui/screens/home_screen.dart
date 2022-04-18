import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/connectivity_cubit.dart';
import '../app_theme.dart';
import 'package:flutter/material.dart';
import '../widgets/home_screen/char_list_title.dart';
import '../widgets/home_screen/characters_content.dart';
import '../widgets/no_internet_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final connectionState = context.watch<ConnectivityCubit>().state;

    if (connectionState.status == ConnectivityStatus.off) {
      return const NoInternetWidget();
    }

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
