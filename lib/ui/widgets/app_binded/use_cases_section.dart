import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';

class UseCasesSection extends StatelessWidget {
  static final _kTopPadding = EdgeInsets.only(top: 15.h);

  final String title;
  final String description;
  final Widget child;

  const UseCasesSection({
    super.key,
    required this.title,
    required this.description,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppTheme.sidePadding,
            child: Text(
              title,
              style: AppTheme.s18w700h20l120507dWhite(context),
            ),
          ),
          Padding(
            padding: AppTheme.sidePadding.add(_kTopPadding),
            child: Text(
              description,
              style: AppTheme.s16w400h20l120507dWhite(context),
            ),
          ),
          child,
        ],
      );
}
