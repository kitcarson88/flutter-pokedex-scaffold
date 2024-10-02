import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/utils/responsiveness_utils.dart';

abstract class BaseDialog extends StatelessWidget {
  final String title;
  final String? icon;

  const BaseDialog({
    super.key,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = _iconSize(context);

    return Dialog(
      insetPadding: AppTheme.sidePadding,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(_radius(context)))),
      child: Padding(
        padding: EdgeInsets.all(_innerPadding(context)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null && icon!.isNotEmpty)
              Padding(
                padding: _iconPadding(context),
                child: SvgPicture.asset(
                  icon!,
                  width: iconSize,
                  height: iconSize,
                  colorFilter: ColorFilter.mode(AppTheme.secondary(context), BlendMode.srcIn),
                ),
              ),
            Padding(
              padding: _descriptionPadding(context),
              child: Text(
                title,
                style: AppTheme.s18w700h20l120507dWhite(context),
              ),
            ),
            body(context),
          ],
        ),
      ),
    );
  }

  Widget body(BuildContext context);

  double _innerPadding(BuildContext context) => ResponsivenessUtils.getValueForDeviceRefinedSize(
        context,
        mobileSmall: 24,
        mobileNormal: 30,
        mobileLarge: 34,
        mobileExtraLarge: 40,
      );

  double _radius(BuildContext context) => ResponsivenessUtils.getValueForDeviceRefinedSize(
        context,
        mobileSmall: 24,
        mobileNormal: 28,
        mobileLarge: 32,
        mobileExtraLarge: 36,
      );

  double _iconSize(BuildContext context) => ResponsivenessUtils.getValueForRefinedHeight(
        context,
        smallHeight: 60,
        normalHeight: 72,
        bigHeight: 80,
      );

  EdgeInsets _iconPadding(BuildContext context) => ResponsivenessUtils.getValueForRefinedHeight(
        context,
        smallHeight: const EdgeInsets.only(bottom: 20),
        normalHeight: const EdgeInsets.only(bottom: 32),
      );

  EdgeInsets _descriptionPadding(BuildContext context) =>
      ResponsivenessUtils.getValueForRefinedHeight(
        context,
        smallHeight: const EdgeInsets.only(bottom: 6.0),
        normalHeight: const EdgeInsets.only(bottom: 8.0),
      );
}
