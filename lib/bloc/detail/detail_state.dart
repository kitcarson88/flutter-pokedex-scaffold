part of 'detail_cubit.dart';

@freezed
class DetailState extends BaseWsState with _$DetailState {
  @Implements<BaseWsState>()
  const factory DetailState.valuesSet({
    @Default(false) bool loading,
    @Default(null) dynamic error,
    @Default(null) PokemonDetail? data,
  }) = _DetailValuesSet;

  factory DetailState.loading(DetailState previousState) => previousState.copyWith(
        loading: true,
        error: null,
        data: null,
      );

  factory DetailState.errorOccurred(DetailState previousState, {required dynamic error}) =>
      previousState.copyWith(
        loading: false,
        error: error,
        data: null,
      );

  factory DetailState.dataFetched(DetailState previousState, {required PokemonDetail data}) =>
      previousState.copyWith(
        loading: false,
        error: null,
        data: data,
      );
}
