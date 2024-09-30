import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/core/models/dto/pokemon_dto.dart';
import 'package:pokedex_scaffold/core/repositories/pokemon_repository.dart';

@Injectable(as: PokemonRepository, env: ['mock'])
class PokemonMockedRepository implements PokemonRepository {
  static const _kFakeDelay = 1;

  @override
  Future<List<PokemonDTO>> getPokemons(
      {String? language = 'en', int offset = 0, int limit = 150, forceReload = false}) async {
    const json = '''
      [
            {
                "id": 1,
                "name": "Bulbasaur",
                "description": "Questo Pokémon può stare a lungo senza\\nmangiare. Accumula energia nel bulbo che\\nha sulla schiena.",
                "main-type": "grass",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
                "url": "https://pokeapi.co/api/v2/pokemon/1/"
            },
            {
                "id": 2,
                "name": "Ivysaur",
                "description": "Il suo bocciolo cresce assorbendo nutrimento e,\\nquando è prossimo alla fioritura, emana un\\nforte profumo.",
                "main-type": "grass",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png",
                "url": "https://pokeapi.co/api/v2/pokemon/2/"
            },
            {
                "id": 3,
                "name": "Venusaur",
                "description": "Il grande fiore che ha sulla schiena può assorbire\\ni raggi solari e trasformarli in energia.",
                "main-type": "grass",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png",
                "url": "https://pokeapi.co/api/v2/pokemon/3/"
            },
            {
                "id": 4,
                "name": "Charmander",
                "description": "Nel silenzio più assoluto si può udire la fiamma\\nin cima alla sua coda scoppiettare bruciando.",
                "main-type": "fire",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png",
                "url": "https://pokeapi.co/api/v2/pokemon/4/"
            },
            {
                "id": 5,
                "name": "Charmeleon",
                "description": "Si infervora durante le lotte più dure e talvolta\\nsputa fiamme bluastre.",
                "main-type": "fire",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png",
                "url": "https://pokeapi.co/api/v2/pokemon/5/"
            },
            {
                "id": 6,
                "name": "Charizard",
                "description": "Quando emette lingue di fuoco roventi\\ndalla bocca, la fiamma rossa sulla punta\\ndella coda brucia più intensamente.",
                "main-type": "fire",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png",
                "url": "https://pokeapi.co/api/v2/pokemon/6/"
            },
            {
                "id": 7,
                "name": "Squirtle",
                "description": "Se ne sta tra i flutti e attacca le prede con\\npotenti getti d’acqua. Se si sente in pericolo\\nsi ritira dentro la corazza.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png",
                "url": "https://pokeapi.co/api/v2/pokemon/7/"
            },
            {
                "id": 8,
                "name": "Wartortle",
                "description": "Quando viene colpito sulla testa si ritira nella\\ncorazza. La coda, però, sporge sempre un po’.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/8.png",
                "url": "https://pokeapi.co/api/v2/pokemon/8/"
            },
            {
                "id": 9,
                "name": "Blastoise",
                "description": "Dopo aver preso la mira colpisce il nemico con\\ngetti d’acqua più potenti di quelli di un idrante.",
                "main-type": "water",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png",
                "url": "https://pokeapi.co/api/v2/pokemon/9/"
            },
            {
                "id": 10,
                "name": "Caterpie",
                "description": "Se gli si toccano le antenne che ha sulla testa,\\nsi difende emettendo un odore insopportabile.",
                "main-type": "bug",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png",
                "url": "https://pokeapi.co/api/v2/pokemon/10/"
            },
            {
                "id": 11,
                "name": "Metapod",
                "description": "Per difendersi indurisce la corazza, ma un colpo\\nviolento può scaraventarlo fuori dal guscio.",
                "main-type": "bug",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/11.png",
                "url": "https://pokeapi.co/api/v2/pokemon/11/"
            },
            {
                "id": 12,
                "name": "Butterfree",
                "description": "Possiede ali idrorepellenti ricoperte da una\\npolvere velenosa. Può volare anche quando\\npiove.",
                "main-type": "bug",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/12.png",
                "url": "https://pokeapi.co/api/v2/pokemon/12/"
            },
            {
                "id": 13,
                "name": "Weedle",
                "description": "Ha un pungiglione acuminato sul capo. Vive tra\\nl’erba alta e nei boschi, dove si nutre di foglie.",
                "main-type": "bug",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/13.png",
                "url": "https://pokeapi.co/api/v2/pokemon/13/"
            },
            {
                "id": 14,
                "name": "Kakuna",
                "description": "È molto limitato nei movimenti. Se si sente\\nminacciato, estrae il pungiglione e avvelena\\nil nemico.",
                "main-type": "bug",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/14.png",
                "url": "https://pokeapi.co/api/v2/pokemon/14/"
            },
            {
                "id": 15,
                "name": "Beedrill",
                "description": "Possiede tre aculei velenosi, due sulle zampe\\nanteriori e uno sull’addome, con cui punge\\nripetutamente i nemici.",
                "main-type": "bug",
                "other-types": [
                    "poison"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/15.png",
                "url": "https://pokeapi.co/api/v2/pokemon/15/"
            },
            {
                "id": 16,
                "name": "Pidgey",
                "description": "Di indole docile, preferisce gettare sabbia\\nverso il nemico per proteggersi piuttosto\\nche attaccarlo.",
                "main-type": "normal",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/16.png",
                "url": "https://pokeapi.co/api/v2/pokemon/16/"
            },
            {
                "id": 17,
                "name": "Pidgeotto",
                "description": "Un Pokémon pieno di vitalità che vola\\ninstancabile sul suo territorio in cerca di prede.",
                "main-type": "normal",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/17.png",
                "url": "https://pokeapi.co/api/v2/pokemon/17/"
            },
            {
                "id": 18,
                "name": "Pidgeot",
                "description": "Può volare a una velocità di Mach 2 in cerca\\ndi prede. I suoi artigli sono armi micidiali.",
                "main-type": "normal",
                "other-types": [
                    "flying"
                ],
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/18.png",
                "url": "https://pokeapi.co/api/v2/pokemon/18/"
            },
            {
                "id": 19,
                "name": "Rattata",
                "description": "Con i suoi incisivi rode qualsiasi cosa.\\nSe se ne avvista uno, è probabile che\\nin zona vivano almeno 40 esemplari.",
                "main-type": "normal",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/19.png",
                "url": "https://pokeapi.co/api/v2/pokemon/19/"
            },
            {
                "id": 20,
                "name": "Raticate",
                "description": "Dispone di zampe posteriori palmate che\\ngli permettono di nuotare nei fiumi in cerca\\ndi prede.",
                "main-type": "normal",
                "thumbnail": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/20.png",
                "url": "https://pokeapi.co/api/v2/pokemon/20/"
            }
            
        ]
    ''';

    await Future.delayed(const Duration(seconds: _kFakeDelay));

    final map = jsonDecode(json) as List;
    return map.map((item) => PokemonDTO.fromJson(item as Map<String, dynamic>)).toList();
  }
}
