import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/core/base/base_view.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_appbar.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/typedefs/nullable_widget_builder.dart';

class ChildTemplate extends StatelessWidget {
  final BaseViewData data;
  final WidgetBuilder builder;
  final NullableWidgetBuilder appBarActionButtonBuilder;

  const ChildTemplate(
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
        hasBackButton: true,
        toolbarHeight: AppTheme.appBarHeight,
        backgroundColor: appbarBackgroundColor,
        leadingButtonIconColor: leadingButtonIconColor,
        dividerColor: dividerColor,
        titleWidget: data.appBarConfiguration.title != null ||
                data.appBarConfiguration.titleBuilder != null
            ? Padding(
                padding:
                    data.appBarConfiguration.centerTitle ? EdgeInsets.zero : AppTheme.sidePadding,
                child: Text(
                  data.appBarConfiguration.title ?? data.appBarConfiguration.titleBuilder!(context),
                  style: AppTheme.s20w700h20cPrimary(context),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
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
