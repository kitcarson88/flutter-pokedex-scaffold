import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/core/models/enum/pokemon_type.dart';
import 'package:pokedex_scaffold/ui/styles/colors.gen.dart';

class UiUtils {
  static String integerStringWithFixedCharacters(int value, int chars) {
    var stringIndex = '$value';

    for (var i = 0; i < chars; ++i) {
      if (value < pow(10, i)) {
        stringIndex = '0$stringIndex';
      }
    }

    return stringIndex;
  }

  static Color colorForPokemonType(PokemonType? type, [bool withAlphaChannel = true]) {
    if (withAlphaChannel) {
      switch (type) {
        case PokemonType.normal:
          return AppColors.normal.withAlpha(100);
        case PokemonType.fighting:
          return AppColors.fighting.withAlpha(100);
        case PokemonType.flying:
          return AppColors.flying.withAlpha(100);
        case PokemonType.poison:
          return AppColors.poison.withAlpha(100);
        case PokemonType.ground:
          return AppColors.ground.withAlpha(100);
        case PokemonType.rock:
          return AppColors.rock.withAlpha(100);
        case PokemonType.bug:
          return AppColors.bug.withAlpha(100);
        case PokemonType.ghost:
          return AppColors.ghost.withAlpha(100);
        case PokemonType.steel:
          return AppColors.steel.withAlpha(100);
        case PokemonType.fire:
          return AppColors.fire.withAlpha(100);
        case PokemonType.water:
          return AppColors.water.withAlpha(100);
        case PokemonType.grass:
          return AppColors.grass.withAlpha(100);
        case PokemonType.electric:
          return AppColors.electric.withAlpha(100);
        case PokemonType.psychic:
          return AppColors.psychic.withAlpha(100);
        case PokemonType.ice:
          return AppColors.ice.withAlpha(100);
        case PokemonType.dragon:
          return AppColors.dragon.withAlpha(100);
        case PokemonType.dark:
          return AppColors.dark.withAlpha(100);
        case PokemonType.fairy:
          return AppColors.fairy.withAlpha(100);
        case PokemonType.unknown:
        case PokemonType.shadow:
        default:
          return Colors.white;
      }
    } else {
      switch (type) {
        case PokemonType.normal:
          return AppColors.softNormal;
        case PokemonType.fighting:
          return AppColors.softFighting;
        case PokemonType.flying:
          return AppColors.softFlying;
        case PokemonType.poison:
          return AppColors.softPoison;
        case PokemonType.ground:
          return AppColors.softGround;
        case PokemonType.rock:
          return AppColors.softRock;
        case PokemonType.bug:
          return AppColors.softBug;
        case PokemonType.ghost:
          return AppColors.softGhost;
        case PokemonType.steel:
          return AppColors.softSteel;
        case PokemonType.fire:
          return AppColors.softFire;
        case PokemonType.water:
          return AppColors.softWater;
        case PokemonType.grass:
          return AppColors.softGrass;
        case PokemonType.electric:
          return AppColors.softElectric;
        case PokemonType.psychic:
          return AppColors.softPsychic;
        case PokemonType.ice:
          return AppColors.softIce;
        case PokemonType.dragon:
          return AppColors.softDragon;
        case PokemonType.dark:
          return AppColors.softDark;
        case PokemonType.fairy:
          return AppColors.softFairy;
        case PokemonType.unknown:
        case PokemonType.shadow:
        default:
          return Colors.white;
      }
    }
  }
}
