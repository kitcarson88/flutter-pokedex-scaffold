import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pokedex_scaffold/core/base/base_view.dart';
import 'package:pokedex_scaffold/ui/styles/colors.gen.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_appbar.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';
import 'package:pokedex_scaffold/utils/typedefs/nullable_widget_builder.dart';

class ModalTemplate extends HookWidget {
  final BaseViewData data;
  final WidgetBuilder builder;
  final NullableWidgetBuilder appBarActionButtonBuilder;

  const ModalTemplate(
    this.data,
    this.builder,
    this.appBarActionButtonBuilder, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (data.isModalNavigable) {
      Color? backgroundColor;
      Color? leadingButtonIconColor;

      if (data.appBarConfiguration.darkBackgroundColor != null && context.isDarkMode()) {
        backgroundColor = data.appBarConfiguration.darkBackgroundColor;
      } else {
        backgroundColor = data.appBarConfiguration.backgroundColor;
      }

      if (data.appBarConfiguration.darkLeadingButtonIconColor != null && context.isDarkMode()) {
        leadingButtonIconColor = data.appBarConfiguration.darkLeadingButtonIconColor;
      } else {
        leadingButtonIconColor = data.appBarConfiguration.leadingButtonIconColor;
      }

      return SafeArea(
        child: Scaffold(
          backgroundColor: context.isDarkMode() ? AppColors.androidDark : Colors.white,
          appBar: PokedexScaffoldAppBar(
            hasBackButton: data.isChildPage,
            isModal: true,
            toolbarHeight: AppTheme.appBarHeight,
            backgroundColor: backgroundColor,
            leadingButtonIconColor: leadingButtonIconColor,
            titleWidget: data.appBarConfiguration.title != null ||
                    data.appBarConfiguration.titleBuilder != null
                ? Padding(
                    padding: data.appBarConfiguration.centerTitle
                        ? EdgeInsets.zero
                        : AppTheme.sidePadding,
                    child: Text(
                      data.appBarConfiguration.title ??
                          data.appBarConfiguration.titleBuilder!(context),
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
        ),
      );
    } else {
      return builder(context);
    }
  }
}
