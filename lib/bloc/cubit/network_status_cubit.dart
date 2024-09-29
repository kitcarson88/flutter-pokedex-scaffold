import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/core/base/base_bloc.dart';
import 'package:pokedex_scaffold/core/services/connectivity_check_service.dart';

part 'network_status_cubit.freezed.dart';
part 'network_status_state.dart';

@singleton
class NetworkStatusCubit extends BaseCubit<NetworkStatusState> {
  final ConnectivityCheckService connectivityCheckService;

  late final StreamSubscription<bool> _streamSubscription;

  NetworkStatusCubit({
    required this.connectivityCheckService,
  }) : super(const NetworkStatusState.valuesSet());

  void initConnectivityMonitoring() async {
    _streamSubscription = connectivityCheckService.isConnectedToInternetStream.listen((connected) {
      emit(NetworkStatusState.valuesSet(connected: connected));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
