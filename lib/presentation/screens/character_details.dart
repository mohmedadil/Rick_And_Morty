import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rickandmorty/data/model/model.dart';
import 'package:rickandmorty/presentation/screens/widgets/sliversmethod.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({super.key, required this.character});
  final CharacterModel character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343A40),
      body: CustomScrollView(
        slivers: [
          sliverAppBar(character),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  characterInfo('Name', character.name!),
                  divider(300),
                  characterInfo('Status', character.status!),
                  divider(295),
                  characterInfo('Species', character.species!),
                  divider(285),
                  characterInfo('Gender', character.gender!),
                  divider(295),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 500,
            )
          ]))
        ],
      ),
    );
  }
}
