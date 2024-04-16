import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/core/utls/app_router.dart';
import 'package:rickandmorty/data/model/model.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    super.key,
    required this.characters,
  });

  final CharacterModel characters;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.details, extra: characters);
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Color(0xffE1E8E8)),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              '${characters.name}',
              style: const TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: Color(0xffE1E8E8),
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Hero(tag: characters.name as String,
            child: Container(
              color: Color(0xff343A40),
              child: characters.image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      height: double.infinity,
                      width: double.infinity,
                      placeholder: 'assets/images/loading.gif',
                      image: characters.image!,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/loading.gif'),
            ),
          ),
        ),
      ),
    );
  }
}
