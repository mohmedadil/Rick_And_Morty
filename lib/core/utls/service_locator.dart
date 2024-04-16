import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rickandmorty/bussiness_logic/cubit/character_cubit.dart';
import 'package:rickandmorty/data/api_service/web_services.dart';
import 'package:rickandmorty/data/repository/character_repo.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<CharacterRepo>(
      CharacterRepo(webServices: CharacterWebServices(dio: Dio())));
  getIt.registerSingleton<CharacterCubit>(CharacterCubit(getIt.get<CharacterRepo>()));
}
