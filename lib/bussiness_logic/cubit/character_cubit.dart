import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty/data/model/model.dart';
import 'package:rickandmorty/data/repository/character_repo.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.characterRepo) : super(CharacterInitial());
  CharacterRepo characterRepo;
  late List<CharacterModel> characters;
  Future<void> getAllCharacter() async {
    try {
      characters = await characterRepo.getAllCharacter();
      emit(CharacterSuccess(character: characters));
    } catch (e) {
      emit(CharacterFaluire());
    }
  }
}
