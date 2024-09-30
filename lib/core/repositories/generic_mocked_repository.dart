import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/core/repositories/generic_repository.dart';

@Injectable(as: GenericRepository, env: ['mock'])
class GenericMockedRepository implements GenericRepository {
  static const _kFakeDelay = 1;

  @override
  Future getDataFromUrl({
    String language = 'en',
    required String url,
  }) async {
    String json;

    if (url.contains('/pokemon-species/')) {
      json = '''
        {
            "base_happiness": 50,
            "capture_rate": 45,
            "color": {
                "name": "green",
                "url": "http://localhost:3000/pokemon-color/5/"
            },
            "egg_groups": [
                {
                    "name": "monster",
                    "url": "http://localhost:3000/egg-group/1/"
                },
                {
                    "name": "plant",
                    "url": "http://localhost:3000/egg-group/7/"
                }
            ],
            "evolution_chain": {
                "url": "http://localhost:3000/evolution-chain/1/"
            },
            "evolves_from_species": null,
            "flavor_text_entries": [
                {
                    "flavor_text": "Alla nascita gli è stato piantato sulla schiena un seme\\nraro. La pianta sboccia e cresce con lui.",
                    "language": {
                        "name": "it",
                        "url": "http://localhost:3000/language/8/"
                    },
                    "version": {
                        "name": "x",
                        "url": "http://localhost:3000/version/23/"
                    }
                },
                {
                    "flavor_text": "Dopo la nascita, cresce traendo nutrimento dal seme\\npiantato sul suo dorso.",
                    "language": {
                        "name": "it",
                        "url": "http://localhost:3000/language/8/"
                    },
                    "version": {
                        "name": "y",
                        "url": "http://localhost:3000/version/24/"
                    }
                },
                {
                    "flavor_text": "È possibile vedere Bulbasaur mentre schiaccia un pisolino\\nsotto il sole. Ha un seme piantato sulla schiena. Grazie ai\\nraggi solari il seme cresce ingrandendosi progressivamente.",
                    "language": {
                        "name": "it",
                        "url": "http://localhost:3000/language/8/"
                    },
                    "version": {
                        "name": "omega-ruby",
                        "url": "http://localhost:3000/version/25/"
                    }
                },
                {
                    "flavor_text": "È possibile vedere Bulbasaur mentre schiaccia un pisolino\\nsotto il sole. Ha un seme piantato sulla schiena. Grazie ai\\nraggi solari il seme cresce ingrandendosi progressivamente.",
                    "language": {
                        "name": "it",
                        "url": "http://localhost:3000/language/8/"
                    },
                    "version": {
                        "name": "alpha-sapphire",
                        "url": "http://localhost:3000/version/26/"
                    }
                },
                {
                    "flavor_text": "Questo Pokémon può stare a lungo senza\\nmangiare. Accumula energia nel bulbo che\\nha sulla schiena.",
                    "language": {
                        "name": "it",
                        "url": "http://localhost:3000/language/8/"
                    },
                    "version": {
                        "name": "lets-go-pikachu",
                        "url": "http://localhost:3000/version/31/"
                    }
                },
                {
                    "flavor_text": "Questo Pokémon può stare a lungo senza\\nmangiare. Accumula energia nel bulbo che\\nha sulla schiena.",
                    "language": {
                        "name": "it",
                        "url": "http://localhost:3000/language/8/"
                    },
                    "version": {
                        "name": "lets-go-eevee",
                        "url": "http://localhost:3000/version/32/"
                    }
                },
                {
                    "flavor_text": "Fin dalla nascita questo Pokémon ha sulla schiena\\nun seme che cresce lentamente.",
                    "language": {
                        "name": "it",
                        "url": "http://localhost:3000/language/8/"
                    },
                    "version": {
                        "name": "sword",
                        "url": "http://localhost:3000/version/33/"
                    }
                },
                {
                    "flavor_text": "Appena nato, trae nutrimento dalle sostanze\\ncontenute nel seme sul dorso.",
                    "language": {
                        "name": "it",
                        "url": "http://localhost:3000/language/8/"
                    },
                    "version": {
                        "name": "shield",
                        "url": "http://localhost:3000/version/34/"
                    }
                }
            ],
            "form_descriptions": [],
            "forms_switchable": false,
            "gender_rate": 1,
            "genera": "Pokémon Seme",
            "generation": {
                "name": "generation-i",
                "url": "http://localhost:3000/generation/1/"
            },
            "growth_rate": {
                "name": "medium-slow",
                "url": "http://localhost:3000/growth-rate/4/"
            },
            "habitat": {
                "name": "grassland",
                "url": "http://localhost:3000/pokemon-habitat/3/"
            },
            "has_gender_differences": false,
            "hatch_counter": 20,
            "id": 1,
            "is_baby": false,
            "is_legendary": false,
            "is_mythical": false,
            "name": "bulbasaur",
            "names": [
                {
                    "language": {
                        "name": "ja-Hrkt",
                        "url": "http://localhost:3000/language/1/"
                    },
                    "name": "フシギダネ"
                },
                {
                    "language": {
                        "name": "roomaji",
                        "url": "http://localhost:3000/language/2/"
                    },
                    "name": "Fushigidane"
                },
                {
                    "language": {
                        "name": "ko",
                        "url": "http://localhost:3000/language/3/"
                    },
                    "name": "이상해씨"
                },
                {
                    "language": {
                        "name": "zh-Hant",
                        "url": "http://localhost:3000/language/4/"
                    },
                    "name": "妙蛙種子"
                },
                {
                    "language": {
                        "name": "fr",
                        "url": "http://localhost:3000/language/5/"
                    },
                    "name": "Bulbizarre"
                },
                {
                    "language": {
                        "name": "de",
                        "url": "http://localhost:3000/language/6/"
                    },
                    "name": "Bisasam"
                },
                {
                    "language": {
                        "name": "es",
                        "url": "http://localhost:3000/language/7/"
                    },
                    "name": "Bulbasaur"
                },
                {
                    "language": {
                        "name": "it",
                        "url": "http://localhost:3000/language/8/"
                    },
                    "name": "Bulbasaur"
                },
                {
                    "language": {
                        "name": "en",
                        "url": "http://localhost:3000/language/9/"
                    },
                    "name": "Bulbasaur"
                },
                {
                    "language": {
                        "name": "ja",
                        "url": "http://localhost:3000/language/11/"
                    },
                    "name": "フシギダネ"
                },
                {
                    "language": {
                        "name": "zh-Hans",
                        "url": "http://localhost:3000/language/12/"
                    },
                    "name": "妙蛙种子"
                }
            ],
            "order": 1,
            "pal_park_encounters": [
                {
                    "area": {
                        "name": "field",
                        "url": "http://localhost:3000/pal-park-area/2/"
                    },
                    "base_score": 50,
                    "rate": 30
                }
            ],
            "pokedex_numbers": [
                {
                    "entry_number": 1,
                    "pokedex": {
                        "name": "national",
                        "url": "http://localhost:3000/pokedex/1/"
                    }
                },
                {
                    "entry_number": 1,
                    "pokedex": {
                        "name": "kanto",
                        "url": "http://localhost:3000/pokedex/2/"
                    }
                },
                {
                    "entry_number": 226,
                    "pokedex": {
                        "name": "original-johto",
                        "url": "http://localhost:3000/pokedex/3/"
                    }
                },
                {
                    "entry_number": 231,
                    "pokedex": {
                        "name": "updated-johto",
                        "url": "http://localhost:3000/pokedex/7/"
                    }
                },
                {
                    "entry_number": 80,
                    "pokedex": {
                        "name": "kalos-central",
                        "url": "http://localhost:3000/pokedex/12/"
                    }
                },
                {
                    "entry_number": 1,
                    "pokedex": {
                        "name": "letsgo-kanto",
                        "url": "http://localhost:3000/pokedex/26/"
                    }
                },
                {
                    "entry_number": 68,
                    "pokedex": {
                        "name": "isle-of-armor",
                        "url": "http://localhost:3000/pokedex/28/"
                    }
                },
                {
                    "entry_number": 164,
                    "pokedex": {
                        "name": "blueberry",
                        "url": "http://localhost:3000/pokedex/33/"
                    }
                }
            ],
            "shape": {
                "name": "quadruped",
                "url": "http://localhost:3000/pokemon-shape/8/"
            },
            "varieties": [
                {
                    "is_default": true,
                    "pokemon": {
                        "name": "bulbasaur",
                        "url": "http://localhost:3000/pokemon/1/"
                    }
                }
            ]
        }
      ''';

      await Future.delayed(const Duration(seconds: _kFakeDelay));

      return jsonDecode(json) as Map<String, dynamic>;
    }

    return null;
  }
}
