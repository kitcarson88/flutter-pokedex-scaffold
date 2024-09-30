import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/core/services/http/http_service.dart';
import 'package:retrofit/retrofit.dart';

part 'generic_repository.g.dart';

@Injectable(env: [Environment.dev, Environment.test, Environment.prod])
@RestApi(parser: Parser.JsonSerializable)
abstract class GenericRepository {
  @factoryMethod
  factory GenericRepository({@factoryParam String? baseUrl}) {
    final dio = HttpService.getDioClient();

    return _GenericRepository(dio, baseUrl: '');
  }

  @GET('{url}')
  Future getDataFromUrl({
    @Header('Accept-Language') String language = 'en',
    @Path() required String url,
  });
}
