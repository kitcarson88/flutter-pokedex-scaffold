part of 'home_cubit.dart';

@freezed
class HomeState extends BaseWsState with _$HomeState {
  @Implements<BaseWsState>()
  const factory HomeState.valuesSet({
    @Default(false) bool loading,
    @Default(null) dynamic error,
    @Default(null) List<PokemonDTO>? data,
  }) = _HomeValuesSet;

  factory HomeState.loading(HomeState previousState) => previousState.copyWith(
        loading: true,
        error: null,
        data: null,
      );

  factory HomeState.errorOccurred(HomeState previousState, {required dynamic error}) =>
      previousState.copyWith(
        loading: false,
        error: error,
        data: null,
      );

  factory HomeState.dataFetched(HomeState previousState, {required List<PokemonDTO> data}) =>
      previousState.copyWith(
        loading: false,
        error: null,
        data: data,
      );
}
