import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/core/templates/child_template.dart';
import 'package:pokedex_scaffold/core/templates/main_template.dart';
import 'package:pokedex_scaffold/core/templates/modal_template.dart';
import 'package:pokedex_scaffold/ui/styles/colors.gen.dart';
import 'package:pokedex_scaffold/utils/typedefs/nullable_widget_builder.dart';

class AppBarData {
  final Color? backgroundColor;
  final bool centerTitle;
  final Color? darkBackgroundColor;
  final Color? darkLeadingButtonIconColor;
  final Color? leadingButtonIconColor;
  final Color? dividerColor;
  final Color? darkDividerColor;
  final String? nestedRouterKey;
  final String? title;
  final String Function(BuildContext context)? titleBuilder;
  final Widget? titleWidget;

  const AppBarData({
    this.nestedRouterKey,
    this.title,
    this.titleBuilder,
    this.titleWidget,
    this.centerTitle = true,
    this.backgroundColor = Colors.transparent,
    this.darkBackgroundColor,
    this.dividerColor = AppColors.secondary,
    this.darkDividerColor = AppColors.secondary,
    this.leadingButtonIconColor = AppColors.primary,
    this.darkLeadingButtonIconColor = AppColors.darkPrimary,
  });
}

class BaseViewData {
  final AppBarData appBarConfiguration;
  final bool isChildPage;
  final bool isModalPage;
  final bool isModalNavigable;
  final Color? backgroundColor;
  final Color? darkBackgroundColor;

  const BaseViewData({
    this.isChildPage = false,
    this.isModalPage = false,
    this.isModalNavigable = false,
    this.appBarConfiguration = const AppBarData(),
    this.backgroundColor,
    this.darkBackgroundColor,
  });
}

class _BaseViewBuilder extends StatelessWidget {
  final BaseViewData data;
  final WidgetBuilder builder;
  final NullableWidgetBuilder appBarActionButtonBuilder;

  const _BaseViewBuilder({
    required this.data,
    required this.builder,
    required this.appBarActionButtonBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (data.isModalPage) {
      return ModalTemplate(data, builder, appBarActionButtonBuilder);
    } else if (data.isChildPage) {
      return ChildTemplate(data, builder, appBarActionButtonBuilder);
    } else {
      return MainTemplate(data, builder, appBarActionButtonBuilder);
    }
  }
}

abstract class BaseStatelessView extends StatelessWidget {
  final BaseViewData _baseViewData;

  const BaseStatelessView({
    super.key,
    BaseViewData baseViewData = const BaseViewData(),
  }) : _baseViewData = baseViewData;

  @override
  @mustCallSuper
  Widget build(BuildContext context) => _BaseViewBuilder(
        data: _baseViewData,
        builder: body,
        appBarActionButtonBuilder: appBarActionButton,
      );

  Widget body(BuildContext context);

  Widget? appBarActionButton(BuildContext context) => null;
}

abstract class BaseStatefulView extends StatefulWidget {
  final BaseViewData _baseViewData;

  const BaseStatefulView({
    super.key,
    BaseViewData baseViewData = const BaseViewData(),
  }) : _baseViewData = baseViewData;
}

abstract class BaseStatefulViewState<Page extends BaseStatefulView> extends State<Page> {
  @override
  @mustCallSuper
  Widget build(BuildContext context) => _BaseViewBuilder(
        data: widget._baseViewData,
        builder: body,
        appBarActionButtonBuilder: appBarActionButton,
      );

  Widget body(BuildContext context);

  Widget? appBarActionButton(BuildContext context) => null;
}
