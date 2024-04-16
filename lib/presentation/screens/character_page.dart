import 'package:flutter/material.dart';
import 'package:rickandmorty/bussiness_logic/cubit/character_cubit.dart';
import 'package:rickandmorty/data/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/presentation/screens/widgets/GridViewItem.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  late List<CharacterModel> characters;
  late List<CharacterModel> searchedForCharacters;
  final textController = TextEditingController();
  bool isSearching = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? customTextField()
            : const Text(
                'Character',
                style: TextStyle(color: Color(0xff343A40)),
              ),
        actions: isSearchingAction(),
        backgroundColor: Color(0xffFFC107),
        centerTitle: true,
      ),
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterSuccess) {
            characters = state.character;
            return GridViewItem(
                characters: textController.text.isEmpty
                    ? characters
                    : searchedForCharacters);
          } else if (state is CharacterFaluire) {
            return Center(child: Text('No Internet Connection'));
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xffFFC107),
              ),
            );
          }
        },
      ),
    );
  }

  Widget customTextField() {
    return TextField(
      controller: textController,
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        hintText: "Find a character....",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Color(0xff343A40), fontSize: 18),
      ),
      style: const TextStyle(color: Color(0xff343A40), fontSize: 18),
      onChanged: (value) {
        forsearching(value);
      }, // InputDecoration
    );
  }

  List<Widget> isSearchingAction() {
    if (isSearching == true) {
      return [
        IconButton(
            onPressed: () {
              clearSearching();
              Navigator.pop(context);
            },
            icon: Icon(Icons.clear))
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              _startSearch();
            },
            icon: Icon(Icons.search))
      ];
    }
  }

  void forsearching(String value) {
    searchedForCharacters = characters
        .where((element) => element.name!.toLowerCase().startsWith(value))
        .toList();
    setState(() {});
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearching() {
    clearSearching();
    setState(() {
      isSearching = false;
    });
  }

  clearSearching() {
    setState(() {
      textController.clear();
    });
  }
}
