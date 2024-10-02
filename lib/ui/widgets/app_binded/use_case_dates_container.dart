import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';

class UseCasesDatesContainer extends StatelessWidget {
  final String title;
  final List<String> parsedDates;

  const UseCasesDatesContainer({
    super.key,
    required this.title,
    required this.parsedDates,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              title,
              style: AppTheme.s16w600h20l120507dWhite(context),
            ),
          ),
          for (final date in parsedDates)
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Text(
                date,
                style: AppTheme.s16w400h20l120507dWhite(context),
              ),
            ),
        ],
      );
}
