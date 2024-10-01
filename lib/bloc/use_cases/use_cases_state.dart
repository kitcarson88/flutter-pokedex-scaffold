part of 'use_cases_cubit.dart';

@freezed
class UseCasesState extends BaseWsState with _$UseCasesState {
  @Implements<BaseWsState>()
  const factory UseCasesState.valuesSet({
    @Default(false) bool loading,
    @Default(null) dynamic error,
    @Default(null) (List<Switch>, List<DateTime>, List<TimezonedDateTime>)? data,
  }) = _UseCasesValuesSet;

  factory UseCasesState.loading(UseCasesState previousState) => previousState.copyWith(
        loading: true,
        error: null,
        data: null,
      );

  factory UseCasesState.errorOccurred(UseCasesState previousState, {required dynamic error}) =>
      previousState.copyWith(
        loading: false,
        error: error,
        data: null,
      );

  factory UseCasesState.dataFetched(
    UseCasesState previousState, {
    required List<Switch> switches,
    required List<DateTime> dates,
    required List<TimezonedDateTime> datesWithTimezones,
  }) =>
      previousState.copyWith(
        loading: false,
        error: null,
        data: (switches, dates, datesWithTimezones),
      );

  factory UseCasesState.updateSwitches(
    UseCasesState previousState, {
    required List<Switch> switches,
  }) =>
      previousState.copyWith(data: (switches, previousState.data!.$2, previousState.data!.$3));
}
