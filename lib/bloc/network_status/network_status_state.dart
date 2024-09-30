part of 'network_status_cubit.dart';

@freezed
class NetworkStatusState with _$NetworkStatusState {
  const factory NetworkStatusState.valuesSet({
    @Default(true) bool connected,
  }) = _NetworkStatusValuesSet;
}
