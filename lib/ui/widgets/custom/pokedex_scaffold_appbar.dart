import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/common/preferred_size_divider.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_appbar_back_button.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_appbar_button_sizer.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_appbar_title.dart';

class PokedexScaffoldAppBar extends AppBar {
  final Color? darkLeadingButtonIconColor;
  final bool hasBackButton;
  final bool isModal;
  final Color? dividerColor;
  final Color? leadingButtonIconColor;
  final String? nestedRouterKey;
  final bool titleCentered;
  final Widget? titleWidget;
  final Widget? actionButton;

  PokedexScaffoldAppBar({
    super.key,
    this.hasBackButton = false,
    this.isModal = false,
    super.toolbarHeight,
    super.backgroundColor,
    // super.systemOverlayStyle = SystemUiOverlayStyle.light,
    this.dividerColor,
    this.leadingButtonIconColor,
    this.darkLeadingButtonIconColor,
    this.nestedRouterKey,
    this.titleCentered = true,
    this.titleWidget,
    this.actionButton,
  }) : super(
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          bottom: dividerColor != null
              ? PreferredSizeDivider(
                  height: 1,
                  thickness: 0,
                  color: dividerColor,
                  indent: AppTheme.sidePadding.left,
                  endIndent: AppTheme.sidePadding.right,
                )
              : null,
          automaticallyImplyLeading: false,
          leadingWidth: 0,
          centerTitle: true,
          titleSpacing: AppTheme.sidePadding.left -
              (AppTheme.appBarHeight - AppTheme.appBarLeadingButtonIconSize) / 2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (hasBackButton)
                PokedexScaffoldAppBarBackButton(
                  isModal: isModal,
                  iconColor: leadingButtonIconColor,
                  nestedRouterKey: nestedRouterKey,
                ),
              if (!hasBackButton && titleCentered) const PokedexScaffoldAppBarButtonSizer(),
              PokedexScaffoldAppBarTitle(
                titleWidget: titleWidget ?? Container(),
                centerTitle: titleCentered,
                useLeftPadding: !titleCentered && !hasBackButton,
              ),
              PokedexScaffoldAppBarButtonSizer(
                child:
                    // (!kReleaseMode && constants.enableDebugEndDrawer && actionButton == null
                    //         ? Builder(
                    //             builder: (context) => HapticCupertinoButton(
                    //               padding: EdgeInsets.zero,
                    //               onPressed: DebugEndDrawerScaffold.openDebugEndDrawer,
                    //               child: Assets.icons.log.svg(
                    //                 width: AppTheme.appBarLeadingButtonIconSize,
                    //                 colorFilter:
                    //                     ColorFilter.mode(AppTheme.primary(context), BlendMode.srcIn),
                    //               ),
                    //             ),
                    //           )
                    //         : null) ??
                    actionButton,
              ),
            ],
          ),
        );
}
