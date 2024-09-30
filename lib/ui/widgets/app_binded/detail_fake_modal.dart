import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/core/models/form/pokemon_detail.dart';
import 'package:pokedex_scaffold/ui/widgets/app_binded/detail_infos.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_fake_modal.dart';

class DetailFakeModal extends StatelessWidget {
  static final _kInfosPadding = EdgeInsets.only(top: 10.h);

  final PokemonDetail data;
  final double screenHeight;
  final double cardDisplacement;
  final double pokemonImageSize;

  const DetailFakeModal({
    super.key,
    required this.data,
    required this.screenHeight,
    required this.cardDisplacement,
    required this.pokemonImageSize,
  });

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          PokedexScaffoldFakeModal(
            minHeight: screenHeight / 2 - cardDisplacement,
            child: Padding(
              padding:
                  _kInfosPadding.add(EdgeInsets.only(top: pokemonImageSize / 2 - cardDisplacement)),
              child: DetailInfos(data),
            ),
          ),
          Positioned(
            top: -pokemonImageSize / 2 - cardDisplacement,
            child: SizedBox(
              height: pokemonImageSize,
              child: CachedNetworkImage(
                imageUrl: data.image,
                placeholder: (context, url) => Container(),
                errorWidget: (context, url, error) => Container(),
              ),
            ),
          ),
        ],
      );
}
