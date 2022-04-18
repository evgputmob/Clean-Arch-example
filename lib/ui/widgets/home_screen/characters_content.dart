import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/characters_cubit.dart';
import 'character_grid_item.dart';

class CharactersContent extends StatelessWidget {
  const CharactersContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final charsState = context.watch<CharactersCubit>().state;

    switch (charsState.status) {
      //---
      case CharactersStatus.initial:
        context.read<CharactersCubit>().getAllCharacters();
        return const SizedBox.shrink();
      //---
      case CharactersStatus.loading:
        return const Center(child: CircularProgressIndicator());
      //---
      case CharactersStatus.failure:
        return Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (charsState.exception != null)
                      ? Text(charsState.exception!, textAlign: TextAlign.center)
                      : const Text('Something went wrong',
                          textAlign: TextAlign.center),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    child: const Text('Try again'),
                    onPressed: context
                        .read<CharactersCubit>()
                        .tryGetAllCharactersAgain,
                  )
                ],
              )),
        );
      //---
      case CharactersStatus.success:
    }

    final charsList = charsState.charactersList;

    return BuildCondition(
      condition: charsList.isNotEmpty,
      builder: (context) {
        return RefreshIndicator(
          onRefresh: context.read<CharactersCubit>().tryGetAllCharactersAgain,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: charsList.length,
            itemBuilder: (context, index) {
              EdgeInsets _itemMargins;
              if (index % 2 == 0) {
                _itemMargins = (index == charsList.length - 2)
                    ? const EdgeInsets.fromLTRB(12, 15, 6, 15)
                    : const EdgeInsets.fromLTRB(12, 15, 6, 0);
              } else {
                _itemMargins = (index == charsList.length - 1)
                    ? const EdgeInsets.fromLTRB(6, 15, 12, 15)
                    : const EdgeInsets.fromLTRB(6, 15, 12, 0);
              }
              return CharacterGridItem(
                character: charsList[index],
                itemMargins: _itemMargins,
              );
            },
          ),
        );
      },
      fallback: (context) => const SizedBox.shrink(),
    );
  }
}
