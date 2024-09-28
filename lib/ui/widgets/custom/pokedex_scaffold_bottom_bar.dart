import 'package:fancy_bottom_tab_bar/fancy_bottom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/ui/styles/assets.gen.dart';
import 'package:pokedex_scaffold/ui/styles/colors.gen.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/common/flexible_text.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';

class PokedexScaffoldBottomBar extends FancyBottomTabBar {
  static final _iconsSize = 24.h;

  PokedexScaffoldBottomBar({
    super.key,
    required void Function(int) onItemTap,
  }) : super(
          height: AppTheme.bottomBarHeight,
          topPadding: 20,
          cursorSize: 39,
          cursorLedge: 14,
          backgroundGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.secondary,
              AppColors.primary,
            ],
          ),
          darkBackgroundGradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.darkSecondary,
              AppColors.darkPrimary,
            ],
          ),
          boxShadows: const [
            BoxShadow(color: Colors.black12, offset: Offset(0, -2), blurRadius: 8),
          ],
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(10.w), topRight: Radius.circular(10.w)),
          cursorColor: Colors.white,
          darkCursorColor: AppColors.iosDark,
          icons: [
            Assets.icons.home.svg(
              width: _iconsSize,
              height: _iconsSize,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            Assets.icons.pokeballBlackWhite.svg(
              width: _iconsSize,
              height: _iconsSize,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            Assets.icons.bulb.svg(
              width: _iconsSize,
              height: _iconsSize,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            Assets.icons.tech.svg(
              width: _iconsSize,
              height: _iconsSize,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ],
          darkIcons: [
            Assets.icons.home.svg(
              width: _iconsSize,
              height: _iconsSize,
              colorFilter: const ColorFilter.mode(AppColors.iosDark, BlendMode.srcIn),
            ),
            Assets.icons.pokeballBlackWhite.svg(
              width: _iconsSize,
              height: _iconsSize,
              colorFilter: const ColorFilter.mode(AppColors.iosDark, BlendMode.srcIn),
            ),
            Assets.icons.bulb.svg(
              width: _iconsSize,
              height: _iconsSize,
              colorFilter: const ColorFilter.mode(AppColors.iosDark, BlendMode.srcIn),
            ),
            Assets.icons.tech.svg(
              width: _iconsSize,
              height: _iconsSize,
              colorFilter: const ColorFilter.mode(AppColors.iosDark, BlendMode.srcIn),
            ),
          ],
          activeIcons: [
            Assets.icons.home.svg(
              width: _iconsSize,
              height: _iconsSize,
              colorFilter: const ColorFilter.mode(AppColors.secondary, BlendMode.srcIn),
            ),
            Assets.icons.pokeballBlackWhite.svg(
              width: _iconsSize,
              height: _iconsSize,
              colorFilter: const ColorFilter.mode(AppColors.secondary, BlendMode.srcIn),
            ),
            Assets.icons.bulb.svg(
              width: _iconsSize,
              height: _iconsSize,
              colorFilter: const ColorFilter.mode(AppColors.secondary, BlendMode.srcIn),
            ),
            Assets.icons.tech.svg(
              width: _iconsSize,
              height: _iconsSize,
              colorFilter: const ColorFilter.mode(AppColors.secondary, BlendMode.srcIn),
            ),
          ],
          darkActiveIcons: [
            Assets.icons.home.svg(
              width: _iconsSize,
              height: _iconsSize,
              colorFilter: const ColorFilter.mode(AppColors.darkSecondary, BlendMode.srcIn),
            ),
            Assets.icons.pokeballBlackWhite.svg(
              width: _iconsSize,
              height: _iconsSize,
              colorFilter: const ColorFilter.mode(AppColors.darkSecondary, BlendMode.srcIn),
            ),
            Assets.icons.bulb.svg(
              width: _iconsSize,
              height: _iconsSize,
              colorFilter: const ColorFilter.mode(AppColors.darkSecondary, BlendMode.srcIn),
            ),
            Assets.icons.tech.svg(
              width: _iconsSize,
              height: _iconsSize,
              colorFilter: const ColorFilter.mode(AppColors.darkSecondary, BlendMode.srcIn),
            ),
          ],
          labels: [
            Builder(
                builder: (context) => FlexibleText(context.localization.home.toUpperCase(),
                    style: AppTheme.s12w600h30cWhite, overflow: TextOverflow.ellipsis)),
            Builder(
              builder: (context) => FlexibleText(context.localization.favorites.toUpperCase(),
                  style: AppTheme.s12w600h30cWhite, overflow: TextOverflow.ellipsis),
            ),
            Builder(
              builder: (context) => FlexibleText(context.localization.useCases.toUpperCase(),
                  style: AppTheme.s12w600h30cWhite, overflow: TextOverflow.ellipsis),
            ),
            Builder(
              builder: (context) => FlexibleText(context.localization.settings.toUpperCase(),
                  style: AppTheme.s12w600h30cWhite, overflow: TextOverflow.ellipsis),
            ),
          ],
          darkLabels: [
            Builder(
              builder: (context) => FlexibleText(context.localization.home.toUpperCase(),
                  style: AppTheme.s12w600h30cIosDark, overflow: TextOverflow.ellipsis),
            ),
            Builder(
              builder: (context) => FlexibleText(context.localization.favorites.toUpperCase(),
                  style: AppTheme.s12w600h30cIosDark, overflow: TextOverflow.ellipsis),
            ),
            Builder(
              builder: (context) => FlexibleText(context.localization.useCases.toUpperCase(),
                  style: AppTheme.s12w600h30cIosDark, overflow: TextOverflow.ellipsis),
            ),
            Builder(
              builder: (context) => FlexibleText(context.localization.settings.toUpperCase(),
                  style: AppTheme.s12w600h30cIosDark, overflow: TextOverflow.ellipsis),
            ),
          ],
          initialSelectedIndex: 0,
          onItemTap: onItemTap,
        );
}
