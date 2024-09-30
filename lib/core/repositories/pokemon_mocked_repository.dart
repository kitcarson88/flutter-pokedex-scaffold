import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/core/models/dto/pokemon_detail_dto.dart';
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

  @override
  Future<PokemonDetailDTO> getPokemonDetail({String? language = 'en', required String id}) async {
    const json = '''
      {
          "abilities": [
              {
                  "ability": {
                      "name": "overgrow",
                      "url": "http://localhost:3000/ability/65/"
                  },
                  "is_hidden": false,
                  "slot": 1
              },
              {
                  "ability": {
                      "name": "chlorophyll",
                      "url": "http://localhost:3000/ability/34/"
                  },
                  "is_hidden": true,
                  "slot": 3
              }
          ],
          "base_experience": 64,
          "cries": {
              "latest": "https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/latest/1.ogg",
              "legacy": "https://raw.githubusercontent.com/PokeAPI/cries/main/cries/pokemon/legacy/1.ogg"
          },
          "forms": [
              {
                  "name": "bulbasaur",
                  "url": "http://localhost:3000/pokemon-form/1/"
              }
          ],
          "game_indices": [
              {
                  "game_index": 153,
                  "version": {
                      "name": "red",
                      "url": "http://localhost:3000/version/1/"
                  }
              },
              {
                  "game_index": 153,
                  "version": {
                      "name": "blue",
                      "url": "http://localhost:3000/version/2/"
                  }
              },
              {
                  "game_index": 153,
                  "version": {
                      "name": "yellow",
                      "url": "http://localhost:3000/version/3/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "gold",
                      "url": "http://localhost:3000/version/4/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "silver",
                      "url": "http://localhost:3000/version/5/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "crystal",
                      "url": "http://localhost:3000/version/6/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "ruby",
                      "url": "http://localhost:3000/version/7/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "sapphire",
                      "url": "http://localhost:3000/version/8/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "emerald",
                      "url": "http://localhost:3000/version/9/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "firered",
                      "url": "http://localhost:3000/version/10/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "leafgreen",
                      "url": "http://localhost:3000/version/11/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "diamond",
                      "url": "http://localhost:3000/version/12/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "pearl",
                      "url": "http://localhost:3000/version/13/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "platinum",
                      "url": "http://localhost:3000/version/14/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "heartgold",
                      "url": "http://localhost:3000/version/15/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "soulsilver",
                      "url": "http://localhost:3000/version/16/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "black",
                      "url": "http://localhost:3000/version/17/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "white",
                      "url": "http://localhost:3000/version/18/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "black-2",
                      "url": "http://localhost:3000/version/21/"
                  }
              },
              {
                  "game_index": 1,
                  "version": {
                      "name": "white-2",
                      "url": "http://localhost:3000/version/22/"
                  }
              }
          ],
          "height": 7,
          "held_items": [],
          "id": 1,
          "is_default": true,
          "location_area_encounters": "http://localhost:3000/pokemon/1/encounters",
          "name": "bulbasaur",
          "order": 1,
          "past_abilities": [],
          "past_types": [],
          "species": {
              "name": "bulbasaur",
              "url": "http://localhost:3000/pokemon-species/1/"
          },
          "sprites": {
              "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png",
              "back_female": null,
              "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/1.png",
              "back_shiny_female": null,
              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
              "front_female": null,
              "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png",
              "front_shiny_female": null,
              "other": {
                  "dream_world": {
                      "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg",
                      "front_female": null
                  },
                  "home": {
                      "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png",
                      "front_female": null,
                      "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/1.png",
                      "front_shiny_female": null
                  },
                  "official-artwork": {
                      "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
                      "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/1.png"
                  },
                  "showdown": {
                      "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/back/1.gif",
                      "back_female": null,
                      "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/back/shiny/1.gif",
                      "back_shiny_female": null,
                      "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/1.gif",
                      "front_female": null,
                      "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/shiny/1.gif",
                      "front_shiny_female": null
                  }
              },
              "versions": {
                  "generation-i": {
                      "red-blue": {
                          "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/back/1.png",
                          "back_gray": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/back/gray/1.png",
                          "back_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/transparent/back/1.png",
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/1.png",
                          "front_gray": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/gray/1.png",
                          "front_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/transparent/1.png"
                      },
                      "yellow": {
                          "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/back/1.png",
                          "back_gray": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/back/gray/1.png",
                          "back_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/transparent/back/1.png",
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/1.png",
                          "front_gray": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/gray/1.png",
                          "front_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/yellow/transparent/1.png"
                      }
                  },
                  "generation-ii": {
                      "crystal": {
                          "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/back/1.png",
                          "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/back/shiny/1.png",
                          "back_shiny_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/transparent/back/shiny/1.png",
                          "back_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/transparent/back/1.png",
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/1.png",
                          "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/shiny/1.png",
                          "front_shiny_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/transparent/shiny/1.png",
                          "front_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/crystal/transparent/1.png"
                      },
                      "gold": {
                          "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/back/1.png",
                          "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/back/shiny/1.png",
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/1.png",
                          "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/shiny/1.png",
                          "front_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/gold/transparent/1.png"
                      },
                      "silver": {
                          "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/back/1.png",
                          "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/back/shiny/1.png",
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/1.png",
                          "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/shiny/1.png",
                          "front_transparent": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-ii/silver/transparent/1.png"
                      }
                  },
                  "generation-iii": {
                      "emerald": {
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/emerald/1.png",
                          "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/emerald/shiny/1.png"
                      },
                      "firered-leafgreen": {
                          "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/1.png",
                          "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/back/shiny/1.png",
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/1.png",
                          "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/firered-leafgreen/shiny/1.png"
                      },
                      "ruby-sapphire": {
                          "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/back/1.png",
                          "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/back/shiny/1.png",
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/1.png",
                          "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iii/ruby-sapphire/shiny/1.png"
                      }
                  },
                  "generation-iv": {
                      "diamond-pearl": {
                          "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/back/1.png",
                          "back_female": null,
                          "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/back/shiny/1.png",
                          "back_shiny_female": null,
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/1.png",
                          "front_female": null,
                          "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/diamond-pearl/shiny/1.png",
                          "front_shiny_female": null
                      },
                      "heartgold-soulsilver": {
                          "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/back/1.png",
                          "back_female": null,
                          "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/back/shiny/1.png",
                          "back_shiny_female": null,
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/1.png",
                          "front_female": null,
                          "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/heartgold-soulsilver/shiny/1.png",
                          "front_shiny_female": null
                      },
                      "platinum": {
                          "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/back/1.png",
                          "back_female": null,
                          "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/back/shiny/1.png",
                          "back_shiny_female": null,
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/1.png",
                          "front_female": null,
                          "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-iv/platinum/shiny/1.png",
                          "front_shiny_female": null
                      }
                  },
                  "generation-v": {
                      "black-white": {
                          "animated": {
                              "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/back/1.gif",
                              "back_female": null,
                              "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/back/shiny/1.gif",
                              "back_shiny_female": null,
                              "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/1.gif",
                              "front_female": null,
                              "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/animated/shiny/1.gif",
                              "front_shiny_female": null
                          },
                          "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/back/1.png",
                          "back_female": null,
                          "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/back/shiny/1.png",
                          "back_shiny_female": null,
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/1.png",
                          "front_female": null,
                          "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-v/black-white/shiny/1.png",
                          "front_shiny_female": null
                      }
                  },
                  "generation-vi": {
                      "omegaruby-alphasapphire": {
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/omegaruby-alphasapphire/1.png",
                          "front_female": null,
                          "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/omegaruby-alphasapphire/shiny/1.png",
                          "front_shiny_female": null
                      },
                      "x-y": {
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/x-y/1.png",
                          "front_female": null,
                          "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vi/x-y/shiny/1.png",
                          "front_shiny_female": null
                      }
                  },
                  "generation-vii": {
                      "icons": {
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/icons/1.png",
                          "front_female": null
                      },
                      "ultra-sun-ultra-moon": {
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/ultra-sun-ultra-moon/1.png",
                          "front_female": null,
                          "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-vii/ultra-sun-ultra-moon/shiny/1.png",
                          "front_shiny_female": null
                      }
                  },
                  "generation-viii": {
                      "icons": {
                          "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-viii/icons/1.png",
                          "front_female": null
                      }
                  }
              }
          },
          "stats": [
              {
                  "base_stat": 45,
                  "stat": {
                      "name": "hp",
                      "translated_name": "ps",
                      "url": "http://localhost:3000/stat/1/"
                  }
              },
              {
                  "base_stat": 49,
                  "stat": {
                      "name": "attack",
                      "translated_name": "attacco",
                      "url": "http://localhost:3000/stat/2/"
                  }
              },
              {
                  "base_stat": 49,
                  "stat": {
                      "name": "defense",
                      "translated_name": "difesa",
                      "url": "http://localhost:3000/stat/3/"
                  }
              },
              {
                  "base_stat": 65,
                  "stat": {
                      "name": "special-attack",
                      "translated_name": "attacco speciale",
                      "url": "http://localhost:3000/stat/4/"
                  }
              },
              {
                  "base_stat": 65,
                  "stat": {
                      "name": "special-defense",
                      "translated_name": "difesa speciale",
                      "url": "http://localhost:3000/stat/5/"
                  }
              },
              {
                  "base_stat": 45,
                  "stat": {
                      "name": "speed",
                      "translated_name": "velocità",
                      "url": "http://localhost:3000/stat/6/"
                  }
              }
          ],
          "types": [
              {
                  "slot": 1,
                  "type": {
                      "name": "grass",
                      "translated_name": "erba",
                      "url": "http://localhost:3000/type/12/"
                  }
              },
              {
                  "slot": 2,
                  "type": {
                      "name": "poison",
                      "translated_name": "veleno",
                      "url": "http://localhost:3000/type/4/"
                  }
              }
          ],
          "weight": 69
      }
    ''';

    await Future.delayed(const Duration(seconds: _kFakeDelay));

    final map = jsonDecode(json) as Map<String, dynamic>;
    return PokemonDetailDTO.fromJson(map);
  }
}
