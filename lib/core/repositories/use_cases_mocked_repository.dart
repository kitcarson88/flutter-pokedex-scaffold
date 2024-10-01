import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/core/models/dto/date_dto.dart';
import 'package:pokedex_scaffold/core/models/dto/date_with_timezone_dto.dart';
import 'package:pokedex_scaffold/core/models/dto/switch_dto.dart';
import 'package:pokedex_scaffold/core/repositories/use_cases_repository.dart';

@Injectable(as: UseCasesRepository, env: ['mock'])
class UseCasesMockedRepository implements UseCasesRepository {
  static const _kFakeDelay = 1;

  @override
  Future<List<DateWithTimezoneDTO>> getDatesWithTimezones() async {
    const json = '''
      [
        {
            "date": "1988-12-12T16:15:00.000+02:00"
        },
        {
            "date": "1988-12-12T15:15:00.000+01:00"
        },
        {
            "date": "1988-12-12T13:15:00.000-01:00"
        }
      ]
    ''';

    await Future.delayed(const Duration(seconds: _kFakeDelay));

    final map = jsonDecode(json) as List;
    return map.map((item) => DateWithTimezoneDTO.fromJson(item as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<DateDTO>> getSimpleDates() async {
    const json = '''
      [
        {
            "date": "1988-12-12T16:15:00.000+02:00"
        },
        {
            "date": "1988-12-12T15:15:00.000+01:00"
        },
        {
            "date": "1988-12-12T13:15:00.000-01:00"
        }
      ]
    ''';

    await Future.delayed(const Duration(seconds: _kFakeDelay));

    final map = jsonDecode(json) as List;
    return map.map((item) => DateDTO.fromJson(item as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<SwitchDTO>> getSwitches([String? language = 'en']) async {
    const json = '''
      [
            {
                "id": 1,
                "value": "Value 1"
            },
            {
                "id": 2,
                "value": "Value 2"
            },
            {
                "id": 3,
                "value": "Value 3"
            },
            {
                "id": 4,
                "value": "Value 4"
            },
            {
                "id": 5,
                "value": "Value 5"
            }
        ]
    ''';

    await Future.delayed(const Duration(seconds: _kFakeDelay));

    final map = jsonDecode(json) as List;
    return map.map((item) => SwitchDTO.fromJson(item as Map<String, dynamic>)).toList();
  }
}
