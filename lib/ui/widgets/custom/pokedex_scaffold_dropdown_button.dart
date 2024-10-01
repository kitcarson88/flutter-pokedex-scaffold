import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/ui/styles/assets.gen.dart';
import 'package:pokedex_scaffold/ui/styles/colors.gen.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';
import 'package:pokedex_scaffold/ui/widgets/common/expandable_dropdown_button.dart';

class PokedexScaffoldDropdownItem<T> extends DropdownItem<T?> {
  PokedexScaffoldDropdownItem({
    required super.key,
    required super.value,
  });
}

class PokedexScaffoldDropdownButton<T> extends StatelessWidget {
  static const _kExpandableDropdownItemsLimit = 3;

  final T? current;
  final List<PokedexScaffoldDropdownItem<T>>? items;
  final void Function(T?)? onItemSelect;
  final String? title;
  final bool nullValueSelectable;

  final EdgeInsetsGeometry? padding, margin, itemsPadding;

  const PokedexScaffoldDropdownButton({
    super.key,
    this.current,
    required this.items,
    required this.onItemSelect,
    this.title,
    this.padding,
    this.margin,
    this.itemsPadding,
    this.nullValueSelectable = false,
  });

  @override
  Widget build(BuildContext context) => items == null ||
          onItemSelect == null ||
          items!.where((item) => item.key != null).length > _kExpandableDropdownItemsLimit
      ? PokedexScaffoldOverlayDropdownButton(
          title: title,
          current: current,
          items: items,
          onItemSelect: onItemSelect,
          padding: padding,
          margin: margin,
          nullValueSelectable: nullValueSelectable,
        )
      : PokedexScaffoldExpandableDropdownButton(
          title: title,
          current: current,
          items: items!,
          onItemSelect: onItemSelect,
          padding: padding,
          margin: margin,
          itemsPadding: itemsPadding,
          nullValueSelectable: nullValueSelectable,
        );
}

class PokedexScaffoldExpandableDropdownButton<T> extends StatelessWidget {
  final T? current;
  final List<PokedexScaffoldDropdownItem<T>> items;
  final void Function(T?)? onItemSelect;
  final String? title;
  final bool nullValueSelectable;

  final EdgeInsetsGeometry? padding, margin, itemsPadding;

  const PokedexScaffoldExpandableDropdownButton({
    super.key,
    required this.current,
    required this.items,
    required this.onItemSelect,
    this.title,
    this.padding,
    this.margin,
    this.itemsPadding,
    this.nullValueSelectable = false,
  });

  @override
  Widget build(BuildContext context) => title != null
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Text(
                title!,
                style: AppTheme.s16w600h24lPrimarydWhite(context),
              ),
            ),
            _PokedexScaffoldExpandableDropdownButton(
              items: items,
              current: current,
              onItemSelect: onItemSelect,
              padding: padding,
              margin: margin,
              itemsPadding: itemsPadding,
              nullValueSelectable: nullValueSelectable,
            ),
          ],
        )
      : _PokedexScaffoldExpandableDropdownButton(
          items: items,
          current: current,
          onItemSelect: onItemSelect,
          padding: padding,
          margin: margin,
          itemsPadding: itemsPadding,
          nullValueSelectable: nullValueSelectable,
        );
}

class _PokedexScaffoldExpandableDropdownButton<T> extends ExpandableDropdownButton<T?> {
  _PokedexScaffoldExpandableDropdownButton({
    required List<PokedexScaffoldDropdownItem<T>> super.items,
    required super.current,
    required super.onItemSelect,
    EdgeInsetsGeometry? padding,
    super.margin,
    EdgeInsetsGeometry? itemsPadding,
    super.nullValueSelectable,
  }) : super(
          backgroundColor: Colors.white,
          darkBackgroundColor: AppColors.androidDark,
          selectedValueFontStyle: AppTheme.s16w400h16cPrimary,
          darkSelectedValueFontStyle: AppTheme.s16w400h16cWhite,
          itemsFontStyle: AppTheme.s16w400h16cPrimary,
          darkItemsFontStyle: AppTheme.s16w400h16cWhite,
          padding: padding ?? EdgeInsetsDirectional.fromSTEB(20.w, 20.h, 15.w, 20.h),
          itemsPadding: itemsPadding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          itemsDividerSideIndent: 12.w,
          border: Border.all(
            width: 1,
            color: AppColors.secondary,
          ),
          borderRadius: AppTheme.defaultBorderRadius,
          downArrowIcon: Assets.icons.arrowDown.svg(
            height: 10,
            colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
          ),
          darkDownArrowIcon: Assets.icons.arrowDown.svg(
            height: 10,
            colorFilter: const ColorFilter.mode(AppColors.cF5F6F7, BlendMode.srcIn),
          ),
        );
}

class PokedexScaffoldOverlayDropdownButton<T> extends StatelessWidget {
  final T? current;
  final List<PokedexScaffoldDropdownItem<T>>? items;
  final void Function(T?)? onItemSelect;
  final String? title;
  final bool nullValueSelectable;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const PokedexScaffoldOverlayDropdownButton({
    super.key,
    required this.items,
    required this.current,
    required this.onItemSelect,
    this.title,
    this.padding,
    this.margin,
    this.nullValueSelectable = false,
  });

  @override
  Widget build(BuildContext context) => title != null
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Text(
                title!,
                style: AppTheme.s16w600h24lPrimarydWhite(context),
              ),
            ),
            _PokedexScaffoldOverlayDropdownButton(
              padding: padding,
              margin: margin,
              current: current,
              items: items,
              onItemSelect: onItemSelect,
              nullValueSelectable: nullValueSelectable,
            ),
          ],
        )
      : _PokedexScaffoldOverlayDropdownButton(
          padding: padding,
          margin: margin,
          current: current,
          items: items,
          onItemSelect: onItemSelect,
          nullValueSelectable: nullValueSelectable,
        );
}

class _PokedexScaffoldOverlayDropdownButton<T> extends StatefulWidget {
  const _PokedexScaffoldOverlayDropdownButton({
    required this.padding,
    required this.margin,
    required this.current,
    required this.items,
    required this.onItemSelect,
    this.nullValueSelectable = false,
  });

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final T? current;
  final List<PokedexScaffoldDropdownItem<T>>? items;
  final void Function(T? p1)? onItemSelect;
  final bool nullValueSelectable;

  @override
  State<_PokedexScaffoldOverlayDropdownButton<T>> createState() =>
      _PokedexScaffoldOverlayDropdownButtonState<T>();
}

class _PokedexScaffoldOverlayDropdownButtonState<T>
    extends State<_PokedexScaffoldOverlayDropdownButton<T>> {
  T? _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.current;
  }

  @override
  void didUpdateWidget(covariant _PokedexScaffoldOverlayDropdownButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.current != widget.current) {
      setState(() {
        _currentValue = widget.current;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: widget.padding ?? EdgeInsetsDirectional.only(start: 20.w, end: 16.h),
        margin: widget.margin,
        height: 56.h + 2,
        decoration: BoxDecoration(
          color: AppTheme.lWhitedAndroidDark(context),
          border: Border.all(
            width: 1,
            color: AppColors.secondary,
          ),
          borderRadius: AppTheme.defaultBorderRadius,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            autofocus: false,
            enableFeedback: false,
            borderRadius: AppTheme.defaultBorderRadius,
            padding: const EdgeInsets.only(top: 0),
            itemHeight: 56.h,
            style: AppTheme.s16w400h16lPrimarydWhite(context),
            icon: Assets.icons.arrowDown.svg(
              height: 10,
              colorFilter: ColorFilter.mode(
                widget.items == null || widget.onItemSelect == null
                    ? AppTheme.l979797d808080(context)
                    : AppTheme.lPrimarydF5F6F7(context),
                BlendMode.srcIn,
              ),
            ),
            value: _currentValue,
            items: widget.items
                // .where((item) => item.key != null)
                ?.map((item) => DropdownMenuItem(
                      value: item.key,
                      child: Text(
                        item.value,
                        style: widget.items == null || widget.onItemSelect == null
                            ? AppTheme.s16w400h16l979797d808080(context)
                            : AppTheme.s16w400h16lPrimarydWhite(context),
                      ),
                    ))
                .toList(),
            onChanged: widget.onItemSelect != null
                ? (T? value) {
                    if (widget.nullValueSelectable ||
                        (!widget.nullValueSelectable && value != null)) {
                      setState(() {
                        _currentValue = value;
                      });

                      widget.onItemSelect!(value);
                    }
                  }
                : null,
          ),
        ),
      );
}
