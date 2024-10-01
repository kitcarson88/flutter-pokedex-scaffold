part of 'favorites_cubit.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.updated({@Default([]) List<PokemonDTO> favorites}) =
      _FavoritesUpdated;

  factory FavoritesState.fromJson(Map<String, dynamic> json) => _$FavoritesStateFromJson(json);
}
