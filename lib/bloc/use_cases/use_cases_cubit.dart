import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/core/base/base_bloc.dart';
import 'package:pokedex_scaffold/core/models/dto/date_dto.dart';
import 'package:pokedex_scaffold/core/models/dto/date_with_timezone_dto.dart';
import 'package:pokedex_scaffold/core/models/dto/switch_dto.dart';
import 'package:pokedex_scaffold/core/models/form/switch.dart';
import 'package:pokedex_scaffold/core/repositories/use_cases_repository.dart';
import 'package:pokedex_scaffold/utils/typedefs/timezoned_datetime.dart';

part 'use_cases_cubit.freezed.dart';
part 'use_cases_state.dart';

@lazySingleton
class UseCasesCubit extends BaseWsCubit<UseCasesState> {
  final UseCasesRepository useCasesRepository;

  UseCasesCubit({
    required this.useCasesRepository,
  }) : super(const UseCasesState.valuesSet());

  void getUseCasesData({String? language}) async {
    emit(UseCasesState.loading(state));

    try {
      // Sequential rest calls
      // final switches = (await useCasesRepository.getSwitches(language))
      //     .where((dto) => dto.id != null && dto.value != null && dto.value!.isNotEmpty)
      //     .map((dto) => Switch(
      //           id: dto.id!,
      //           value: dto.value!,
      //           enabled: false,
      //         ))
      //     .toList();

      // final dates = (await useCasesRepository.getSimpleDates())
      //     .where((dto) => dto.date != null)
      //     .map((dto) => dto.date!)
      //     .toList();

      // final datesWithTimezones = (await useCasesRepository.getDatesWithTimezones())
      //     .where((dto) => dto.date != null)
      //     .map((dto) => dto.date!)
      //     .toList();

      // Concurrent rest calls
      final data = await Future.wait([
        useCasesRepository.getSwitches(language),
        useCasesRepository.getSimpleDates(),
        useCasesRepository.getDatesWithTimezones(),
      ]);

      final switches = (data[0] as List<SwitchDTO>)
          .where((dto) => dto.id != null && dto.value != null && dto.value!.isNotEmpty)
          .map((dto) => Switch(
                id: dto.id!,
                value: dto.value!,
                enabled: false,
              ))
          .toList();

      final dates = (data[1] as List<DateDTO>)
          .where((dto) => dto.date != null)
          .map((dto) => dto.date!)
          .toList();

      final datesWithTimezones = (data[2] as List<DateWithTimezoneDTO>)
          .where((dto) => dto.date != null)
          .map((dto) => dto.date!)
          .toList();

      emit(UseCasesState.dataFetched(
        state,
        switches: switches,
        dates: dates,
        datesWithTimezones: datesWithTimezones,
      ));
    } catch (e) {
      logger.severe('Error occurred during use case data retrieve: $e');
      emit(UseCasesState.errorOccurred(state, error: e));
    }
  }

  void changeSwitchValueAtIndex(bool value, int index) {
    final switches = state.data!.$1.map((dto) => dto.copyWith()).toList();
    switches[index].enabled = value;
    emit(UseCasesState.updateSwitches(state, switches: switches));
  }

  void enableAllSwitches() {
    final switches = state.data!.$1.map((dto) => dto.copyWith(enabled: true)).toList();
    emit(UseCasesState.updateSwitches(state, switches: switches));
  }
}
