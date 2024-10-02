import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/configs/flavors.dart';
import 'package:pokedex_scaffold/constants/endpoints.dart' as endpoints;
import 'package:pokedex_scaffold/core/models/dto/date_dto.dart';
import 'package:pokedex_scaffold/core/models/dto/date_with_timezone_dto.dart';
import 'package:pokedex_scaffold/core/models/dto/switch_dto.dart';
import 'package:pokedex_scaffold/core/services/http/http_service.dart';
import 'package:retrofit/retrofit.dart';

part 'use_cases_repository.g.dart';

@Injectable(env: [Environment.dev, Environment.test, Environment.prod])
@RestApi()
abstract class UseCasesRepository {
  @factoryMethod
  factory UseCasesRepository({@factoryParam String? baseUrl}) {
    final dio = HttpService.getDioClient();

    return _UseCasesRepository(dio, baseUrl: F.baseUrl + F.baseVersion);
  }

  @GET(endpoints.switches)
  Future<List<SwitchDTO>> getSwitches([
    @Header('Accept-Language') String? language = 'en',
  ]);

  @GET(endpoints.dates)
  Future<List<DateDTO>> getSimpleDates();

  @GET(endpoints.dates)
  Future<List<DateWithTimezoneDTO>> getDatesWithTimezones();
}
