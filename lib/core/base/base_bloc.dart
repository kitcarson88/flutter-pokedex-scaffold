import 'package:bloc/bloc.dart';
import 'package:logging/logging.dart';

abstract class BaseCubit<S> extends Cubit<S> {
  late final Logger logger;

  BaseCubit(super.initialState) {
    logger = Logger(runtimeType.toString());
  }

  @override
  void emit(S state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}

abstract class BaseBloc<E, S> extends Bloc<E, S> {
  late final Logger logger;

  BaseBloc(super.initialState) {
    logger = Logger(runtimeType.toString());
  }
}

abstract class BaseWsCubit<S extends BaseWsState> extends BaseCubit<S> {
  BaseWsCubit(super.initialState);
}

abstract class BaseWsState<T> {
  bool get loading;
  dynamic get error;
  T? get data;
}
