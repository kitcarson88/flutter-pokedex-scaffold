import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/ui/styles/assets.gen.dart';
import 'package:pokedex_scaffold/ui/styles/colors.gen.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/common/haptic_cupertino_button.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';

abstract class BaseModal extends StatelessWidget {
  final bool useNestedNavigation;
  final bool useModalIndicator;

  const BaseModal({
    super.key,
    this.useNestedNavigation = false,
    this.useModalIndicator = true,
  });

  @override
  @mustCallSuper
  Widget build(BuildContext context) => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: AppTheme.defaultBorderRadius,
        ),
        child: Stack(
          children: [
            if (useNestedNavigation)
              Navigator(
                initialRoute: Navigator.defaultRouteName,
                onGenerateRoute: (routeSettings) => MaterialPageRoute(
                  builder: body,
                ),
              ),
            if (!useNestedNavigation)
              Padding(
                padding: EdgeInsets.only(top: AppTheme.appBarHeight),
                child: SafeArea(
                  top: false,
                  bottom: true,
                  child: body(context),
                ),
              ),
            if (useModalIndicator)
              IgnorePointer(
                child: Container(
                  color: Colors.transparent,
                  height: AppTheme.modalBarHeight,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _ModalIndicator(),
                    ],
                  ),
                ),
              ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: HapticCupertinoButton(
                minSize: AppTheme.appBarHeight,
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Assets.icons.cross.svg(
                  width: 40.w,
                  colorFilter: ColorFilter.mode(AppTheme.primary(context), BlendMode.srcIn),
                ),
              ),
            ),
          ],
        ),
      );

  Widget body(BuildContext context);
}

class _ModalIndicator extends StatelessWidget {
  const _ModalIndicator();

  @override
  Widget build(BuildContext context) {
    final indicatorHeight = 6.h;

    return Container(
      width: 56.w,
      height: indicatorHeight,
      decoration: BoxDecoration(
        color: context.isDarkMode() ? Colors.white : AppColors.cCACACA,
        borderRadius: BorderRadius.all(Radius.circular(indicatorHeight / 2)),
      ),
    );
  }
}
