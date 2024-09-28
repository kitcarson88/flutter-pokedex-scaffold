import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/configs/flavors.dart';
import 'package:pokedex_scaffold/constants/endpoints.dart' as endpoints;
import 'package:pokedex_scaffold/core/models/dto/pagination_dto.dart';
import 'package:pokedex_scaffold/core/models/dto/pokemon_dto.dart';
import 'package:pokedex_scaffold/core/services/http/http_service.dart';
import 'package:retrofit/retrofit.dart';

part 'pokemon_repository.g.dart';

@Injectable(env: [Environment.dev, Environment.test, Environment.prod])
@RestApi(parser: Parser.JsonSerializable)
abstract class PokemonRepository {
  PokemonRepository._();

  @factoryMethod
  factory PokemonRepository({
    @factoryParam String? baseUrl,
  }) {
    final dio = HttpService.getDioClient();

    return _PokemonRepository._(dio, baseUrl: F.baseUrl + F.baseVersion);
  }

  @GET(endpoints.pokemon)
  Future<PaginationDTO<PokemonDTO>> _getPokemons({
    @Header('Accept-Language') String? language = 'en',
    @Query('offset') int offset = 0,
    @Query('limit') int limit = 150,
  });

  Future<List<PokemonDTO>> getPokemons({
    String? language = 'en',
    int offset = 0,
    int limit = 150,
  }) async {
    try {
      final data = await _getPokemons(
        language: language,
        offset: offset,
        limit: limit,
      );

      if (data.results == null) {
        throw Exception('Null data received');
      }

      return data.results!;
    } on Exception {
      rethrow;
    }
  }
}
