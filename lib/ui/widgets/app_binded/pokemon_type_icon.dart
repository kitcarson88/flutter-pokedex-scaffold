import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/core/models/enum/pokemon_type.dart';
import 'package:pokedex_scaffold/ui/styles/assets.gen.dart';
import 'package:pokedex_scaffold/ui/styles/colors.gen.dart';

class PokemonTypeIcon extends StatelessWidget {
  final PokemonType type;
  final double size;

  const PokemonTypeIcon(
    this.type, {
    super.key,
    this.size = 100,
  });

  @override
  Widget build(BuildContext context) {
    final iconAsset = _iconFromType(type);

    return iconAsset != null
        ? Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(size / 2)),
              color: _colorFromType(type),
            ),
            child: iconAsset.svg(
              height: (size * 6) / 10,
            ),
          )
        : Container();
  }

  SvgGenImage? _iconFromType(PokemonType type) {
    switch (type) {
      case PokemonType.normal:
        return Assets.icons.normal;
      case PokemonType.fighting:
        return Assets.icons.fighting;
      case PokemonType.flying:
        return Assets.icons.flying;
      case PokemonType.poison:
        return Assets.icons.poison;
      case PokemonType.ground:
        return Assets.icons.ground;
      case PokemonType.rock:
        return Assets.icons.rock;
      case PokemonType.bug:
        return Assets.icons.bug;
      case PokemonType.ghost:
        return Assets.icons.ghost;
      case PokemonType.steel:
        return Assets.icons.steel;
      case PokemonType.fire:
        return Assets.icons.fire;
      case PokemonType.water:
        return Assets.icons.water;
      case PokemonType.grass:
        return Assets.icons.grass;
      case PokemonType.electric:
        return Assets.icons.electric;
      case PokemonType.psychic:
        return Assets.icons.psychic;
      case PokemonType.ice:
        return Assets.icons.ice;
      case PokemonType.dragon:
        return Assets.icons.dragon;
      case PokemonType.dark:
        return Assets.icons.dark;
      case PokemonType.fairy:
        return Assets.icons.fairy;
      default:
        return null;
    }
  }

  Color _colorFromType(PokemonType type) {
    switch (type) {
      case PokemonType.normal:
        return AppColors.normal;
      case PokemonType.fighting:
        return AppColors.fighting;
      case PokemonType.flying:
        return AppColors.flying;
      case PokemonType.poison:
        return AppColors.poison;
      case PokemonType.ground:
        return AppColors.ground;
      case PokemonType.rock:
        return AppColors.rock;
      case PokemonType.bug:
        return AppColors.bug;
      case PokemonType.ghost:
        return AppColors.ghost;
      case PokemonType.steel:
        return AppColors.steel;
      case PokemonType.fire:
        return AppColors.fire;
      case PokemonType.water:
        return AppColors.water;
      case PokemonType.grass:
        return AppColors.grass;
      case PokemonType.electric:
        return AppColors.electric;
      case PokemonType.psychic:
        return AppColors.psychic;
      case PokemonType.ice:
        return AppColors.ice;
      case PokemonType.dragon:
        return AppColors.dragon;
      case PokemonType.dark:
        return AppColors.dark;
      case PokemonType.fairy:
        return AppColors.fairy;
      case PokemonType.unknown:
        return Colors.white;
      case PokemonType.shadow:
        return Colors.white;
      default:
        return Colors.white;
    }
  }
}
