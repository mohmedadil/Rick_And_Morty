import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/core/utls/app_router.dart';
import 'package:rickandmorty/data/model/model.dart';
import 'package:rickandmorty/presentation/screens/widgets/character_item.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    super.key,
    required this.characters,
  });

  final List<CharacterModel>? characters;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff343A40),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: characters!.length,
        itemBuilder: (context, index) =>
            CharacterItem(characters: characters![index]),
      ),
    );
  }
}
