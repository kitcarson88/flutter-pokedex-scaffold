import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/ui/styles/assets.gen.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_link_button.dart';

class FavoriteButton extends StatelessWidget {
  static final _kButtonSize = 46.w;
  static const _kIconSize = 40.0;
  static const _kTransparentLayerSize = 30.0;

  final void Function() onPressed;
  final bool active;

  const FavoriteButton({
    super.key,
    required this.onPressed,
    required this.active,
  });

  @override
  Widget build(BuildContext context) => PokedexScaffoldLinkButton(
        width: _kButtonSize,
        height: _kButtonSize,
        onPressed: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Assets.icons.pokeball.svg(
              width: _kIconSize,
            ),
            if (!active)
              Container(
                width: _kTransparentLayerSize,
                height: _kTransparentLayerSize,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.white.withAlpha(200),
                ),
              ),
          ],
        ),
      );
}
