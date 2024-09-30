import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/ui/styles/assets.gen.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/utils/ui_utils.dart';

class DetailBackground extends StatelessWidget {
  final int id;
  final double screenHeight;
  final double topPadding;
  final double _pokemonImageSize;
  final double _numberHeight;
  final double _pokeballTopPadding;
  final double _pokeballImageSize;

  const DetailBackground({
    super.key,
    required this.screenHeight,
    required this.id,
    required this.topPadding,
    required double pokemonImageSize,
    required double numberHeight,
    required double pokeballTopPadding,
    required double pokeballImageSize,
  })  : _pokemonImageSize = pokemonImageSize,
        _numberHeight = numberHeight,
        _pokeballTopPadding = pokeballTopPadding,
        _pokeballImageSize = pokeballImageSize;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight / 2 -
                    topPadding -
                    _pokemonImageSize / 2 -
                    _numberHeight -
                    _pokeballTopPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  UiUtils.integerStringWithFixedCharacters(id, 3),
                  style: AppTheme.s120w600h120cWhite70,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: _pokeballTopPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.pokeball.image(
                  height: _pokeballImageSize,
                ),
              ],
            ),
          ),
        ],
      );
}
