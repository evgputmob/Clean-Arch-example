import 'package:breaking_bad_bloc_app/cubits/characters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_theme.dart';

class CharListTitle extends StatefulWidget {
  const CharListTitle({Key? key}) : super(key: key);

  @override
  State<CharListTitle> createState() => _CharListTitleState();
}

class _CharListTitleState extends State<CharListTitle> {
  int _index = 0;
  final _controllerTextFieldSearch = TextEditingController();
  final _focusNodeSearch = FocusNode();

  @override
  void dispose() {
    _controllerTextFieldSearch.dispose();
    _focusNodeSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _index,
      children: [
        Row(
          children: [
            const Expanded(child: Text('Characters')),
            IconButton(
              onPressed: () {
                setState(() {
                  _index = 1;
                  FocusScope.of(context).requestFocus(_focusNodeSearch);
                });
              },
              icon: const Icon(Icons.search, size: 32),
            )
          ],
        ),
        Row(
          children: [
            Expanded(child: textFieldSearch(context)),
            IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                _controllerTextFieldSearch.text = '';
                setState(() {
                  _index = 0;
                });
                context.read<CharactersCubit>().getFilteredCharacters('');
              },
              icon: const Icon(Icons.close, size: 32),
            )
          ],
        ),
      ],
    );
  }

  Widget textFieldSearch(BuildContext context) {
    return TextField(
      controller: _controllerTextFieldSearch,
      focusNode: _focusNodeSearch,
      autofocus: false,
      cursorColor: AppTheme.brbaDarkGrey,
      decoration: InputDecoration(
        hintText: 'Type here to find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey.shade700, fontSize: 17),
      ),
      style: const TextStyle(color: AppTheme.brbaDarkGrey, fontSize: 19),
      onChanged: (str) {
        context.read<CharactersCubit>().getFilteredCharacters(str);
      },
    );
  }
}
