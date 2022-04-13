import 'package:get_it/get_it.dart';
import 'cubits/characters_cubit.dart';
import 'cubits/quotes_cubit.dart';
import 'data/repository/characters_repository.dart';
import 'data/services/implementations/breakingbad_service.dart';
import 'data/services/breakingbad_service.dart';
import 'ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  GetIt.I.registerSingleton<IBreakingbadService>(BreakingbadService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CharactersRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CharactersCubit(
                charactersRepository: context.read<CharactersRepository>()),
          ),
          BlocProvider(
            create: (context) => QuotesCubit(
                charactersRepository: context.read<CharactersRepository>()),
          ),
        ],
        child: MaterialApp(
          title: 'Cubit Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.amber),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
