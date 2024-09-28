import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/configs/singleton_locator.dart';
import 'package:pokedex_scaffold/core/services/nested_routing_key_service.dart';
import 'package:pokedex_scaffold/ui/styles/assets.gen.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/common/haptic_cupertino_button.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_appbar_button_sizer.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';

class PokedexScaffoldAppBarBackButton extends StatelessWidget {
  final bool isModal;
  final Color? iconColor;
  final String? nestedRouterKey;

  const PokedexScaffoldAppBarBackButton({
    super.key,
    this.isModal = false,
    this.iconColor,
    this.nestedRouterKey,
  });

  @override
  Widget build(BuildContext context) => PokedexScaffoldAppBarButtonSizer(
        child: HapticCupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            if (isModal) {
              Navigator.of(context).pop();
            } else {
              if (nestedRouterKey != null && nestedRouterKey!.isNotEmpty) {
                var navigationKey =
                    locator<NestedRoutingKeyService>().getNavigationKey(nestedRouterKey!);

                if (navigationKey?.currentState?.controller != null) {
                  final router = navigationKey!.currentState!.controller;
                  router?.maybePop();
                  return;
                }
              }

              AutoRouter.of(context).maybePop();
            }
          },
          child: Transform.scale(
            scaleX: context.isRtl() ? -1 : 1,
            child: Assets.icons.backArrow.svg(
              width: AppTheme.appBarLeadingButtonIconSize,
              colorFilter: iconColor != null ? ColorFilter.mode(iconColor!, BlendMode.srcIn) : null,
            ),
          ),
        ),
      );
}
