import 'package:breaking_bad_bloc_app/logic/connectivity_cubit.dart';
import 'data/services/implementations/connectivity_service.dart';
import 'logic/characters_cubit.dart';
import 'logic/quotes_cubit.dart';
import 'data/repository/characters_repository.dart';
import 'data/services/implementations/breakingbad_service.dart';
import 'ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  //GetIt.I.registerSingleton<IBreakingbadService>(BreakingbadService());
  //GetIt.I.registerSingleton<IConnectivityService>(ConnectivityService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CharactersRepository>(
          create: (context) => CharactersRepository(
            breakingbadService: BreakingbadService(),
            //breakingbadService: GetIt.I<IBreakingbadService>(),
          ),
        ),
      ],
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
          BlocProvider(
            create: (context) =>
                ConnectivityCubit(connectivityService: ConnectivityService()),
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
