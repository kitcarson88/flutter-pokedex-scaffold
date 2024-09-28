import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/core/base/base_view.dart';
import 'package:pokedex_scaffold/ui/styles/assets.gen.dart';
import 'package:pokedex_scaffold/ui/styles/colors.gen.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_appbar.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/typedefs/nullable_widget_builder.dart';

class MainTemplate extends HookWidget {
  final BaseViewData data;
  final WidgetBuilder builder;
  final NullableWidgetBuilder appBarActionButtonBuilder;

  const MainTemplate(
    this.data,
    this.builder,
    this.appBarActionButtonBuilder, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    Color? appbarBackgroundColor;
    Color? leadingButtonIconColor;
    Color? dividerColor;

    if (data.darkBackgroundColor != null && context.isDarkMode()) {
      backgroundColor = data.darkBackgroundColor;
    } else {
      backgroundColor = data.backgroundColor;
    }

    if (data.appBarConfiguration.darkBackgroundColor != null && context.isDarkMode()) {
      appbarBackgroundColor = data.appBarConfiguration.darkBackgroundColor;
    } else {
      appbarBackgroundColor = data.appBarConfiguration.backgroundColor;
    }

    if (data.appBarConfiguration.darkLeadingButtonIconColor != null && context.isDarkMode()) {
      leadingButtonIconColor = data.appBarConfiguration.darkLeadingButtonIconColor;
    } else {
      leadingButtonIconColor = data.appBarConfiguration.leadingButtonIconColor;
    }

    if (data.appBarConfiguration.darkDividerColor != null && context.isDarkMode()) {
      dividerColor = data.appBarConfiguration.darkDividerColor;
    } else {
      dividerColor = data.appBarConfiguration.dividerColor;
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PokedexScaffoldAppBar(
        toolbarHeight: AppTheme.appBarHeight,
        backgroundColor: appbarBackgroundColor,
        leadingButtonIconColor: leadingButtonIconColor,
        dividerColor: dividerColor,
        titleWidget: data.appBarConfiguration.title != null ||
                data.appBarConfiguration.titleBuilder != null
            ? Padding(
                padding:
                    data.appBarConfiguration.centerTitle ? EdgeInsets.zero : AppTheme.sidePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.pokeball.svg(width: 20.w),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 5.w),
                      child: Stack(
                        children: [
                          Text(
                            data.appBarConfiguration.title ??
                                data.appBarConfiguration.titleBuilder!(context),
                            style: AppTheme.s26w700h20cPrimary(context).copyWith(
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 4
                                ..color = AppColors.tertiary,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            data.appBarConfiguration.title ??
                                data.appBarConfiguration.titleBuilder!(context),
                            style: AppTheme.s26w700h20cPrimary(context),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : data.appBarConfiguration.titleWidget,
        titleCentered: data.appBarConfiguration.centerTitle,
        actionButton: appBarActionButtonBuilder(context),
        nestedRouterKey: data.appBarConfiguration.nestedRouterKey,
      ),
      body: builder(context),
    );
  }
}
