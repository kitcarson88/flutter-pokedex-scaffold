import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/core/base/base_bloc.dart';
import 'package:pokedex_scaffold/core/models/dto/pokemon_dto.dart';

part 'favorites_cubit.freezed.dart';
part 'favorites_cubit.g.dart';
part 'favorites_state.dart';

@singleton
class FavoritesCubit extends BaseCubit<FavoritesState> with HydratedMixin {
  FavoritesCubit() : super(const FavoritesState.updated());

  void updateFavorites(PokemonDTO favoriteToAddOrRemove) {
    final favorites = [...state.favorites];

    if (favorites.contains(favoriteToAddOrRemove)) {
      favorites.remove(favoriteToAddOrRemove);
    } else {
      favorites.add(favoriteToAddOrRemove);
    }

    emit(FavoritesState.updated(favorites: favorites));
  }

  void removeFavoriteByIndex(int index) {
    final favorites = [...state.favorites];
    favorites.remove(favorites[index]);
    emit(FavoritesState.updated(favorites: favorites));
  }

  @override
  FavoritesState? fromJson(Map<String, dynamic> json) => FavoritesState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(FavoritesState state) => state.toJson();
}
