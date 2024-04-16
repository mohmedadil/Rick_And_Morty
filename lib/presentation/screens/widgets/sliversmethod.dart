import 'package:flutter/material.dart';
import 'package:rickandmorty/data/model/model.dart';

Widget characterInfo(String title, String value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: [
          TextSpan(
            text: title,
            style: const TextStyle(
                color: Color(0xffE1E8E8),
                fontWeight: FontWeight.bold,
                fontSize: 18), // TextStyle
          ),
          const TextSpan(text: ' : '), // TextSpan
          TextSpan(
              text: value,
              style: const TextStyle(
                color: Color(0xffE1E8E8),
                fontSize: 16,
              )), // TextSpan
        ])); //
  }
   SliverAppBar sliverAppBar(CharacterModel character) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      leading: const BackButton(),
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: const Color(0xff343A40),
      flexibleSpace: FlexibleSpaceBar(
        title: Container(
          padding: const EdgeInsets.all(8),
          color: const Color(0xff343A40),
          child: Text(
            '${character.name}',
            style: const TextStyle(color: Color(0xffE1E8E8)),
          ),
        ),
        background: Hero(
            transitionOnUserGestures: true,
            tag: character.name as String,
            child: Image.network(
              character.image.toString(),
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  Widget divider(double value) {
    return Divider(
      color: const Color(0xffFFC107),
      height: 30,
      thickness: 2,
      endIndent: value,
    );
  }