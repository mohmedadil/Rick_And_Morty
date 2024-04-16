import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/bussiness_logic/cubit/character_cubit.dart';
import 'package:rickandmorty/core/utls/service_locator.dart';
import 'package:rickandmorty/data/model/model.dart';
import 'package:rickandmorty/data/repository/character_repo.dart';
import 'package:rickandmorty/presentation/screens/character_details.dart';
import 'package:rickandmorty/presentation/screens/character_page.dart';

class AppRouter {
  static const home = '/';
  static const details = '/details';
  static final router = GoRouter(routes: [
    GoRoute(
      path: home,
      builder: (context, state) => BlocProvider(
        create: (context) => CharacterCubit(getIt.get<CharacterRepo>()),
        child: const CharacterPage(),
      ),
    ),
    GoRoute(
      path: details,
      builder: (context, state) =>  CharacterDetails(character: state.extra as CharacterModel,),

    )
  ]);
}
