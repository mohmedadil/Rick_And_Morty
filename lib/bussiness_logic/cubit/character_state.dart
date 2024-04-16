part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}
final class CharacterFaluire extends CharacterState {}
final class CharacterSuccess extends CharacterState {
 final List<CharacterModel> character;

  CharacterSuccess({required this.character});
}
