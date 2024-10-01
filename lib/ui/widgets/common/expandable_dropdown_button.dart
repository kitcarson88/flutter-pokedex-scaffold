import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/ui/widgets/common/flexible_text.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_divider.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';

class DropdownItem<K> {
  final K key;
  final String value;

  DropdownItem({
    required this.key,
    required this.value,
  });
}

class ExpandableDropdownButton<K> extends StatefulWidget {
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final K current;
  final Color? darkBackgroundColor;
  final BoxBorder? border, darkBorder;
  final Widget? downArrowIcon, darkDownArrowIcon;
  final TextStyle? selectedValueFontStyle,
      darkSelectedValueFontStyle,
      itemsFontStyle,
      darkItemsFontStyle;
  final bool nullValueSelectable;

  final List<DropdownItem<K>> items;
  final double? itemsDividerSideIndent;
  final EdgeInsetsGeometry? padding, margin, itemsPadding;
  final void Function(K key)? onItemSelect;

  const ExpandableDropdownButton({
    super.key,
    required this.items,
    required this.current,
    this.backgroundColor,
    this.darkBackgroundColor,
    this.border,
    this.darkBorder,
    this.borderRadius,
    this.boxShadow,
    this.padding,
    this.margin,
    this.downArrowIcon,
    this.darkDownArrowIcon,
    this.selectedValueFontStyle,
    this.darkSelectedValueFontStyle,
    this.itemsFontStyle,
    this.darkItemsFontStyle,
    this.itemsPadding,
    this.itemsDividerSideIndent,
    required this.onItemSelect,
    this.nullValueSelectable = false,
  });

  @override
  State<ExpandableDropdownButton<K>> createState() => _ExpandableDropdownButtonState<K>();
}

class _ExpandableDropdownButtonState<K> extends State<ExpandableDropdownButton<K>>
    with TickerProviderStateMixin {
  // K? _currentKey;
  String? _currentValue;
  // late final K _initialKey;
  late final Animation<double> _heightAnimation;
  late final AnimationController _heightAnimationController;
  late final Animation<double> _iconRotationAnimation;
  late final AnimationController _iconRotationController;

  late final List<DropdownItem<K>> filteredItems;

  @override
  void initState() {
    super.initState();

    // _currentKey = widget.current;

    // _initialKey = widget.current;
    final index = widget.items.indexWhere((element) => element.key == widget.current);
    if (index < 0) {
      throw Exception('Current key not found in items');
    }
    _currentValue = widget.items[index].value;

    filteredItems = widget.items
        .where((item) =>
            widget.nullValueSelectable || (!widget.nullValueSelectable && item.key != null))
        .toList();

    _heightAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heightAnimation = CurvedAnimation(
      parent: _heightAnimationController,
      curve: Curves.easeInOut,
    );

    _iconRotationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _iconRotationAnimation = Tween<double>(begin: 0, end: math.pi).animate(_iconRotationController);
  }

  @override
  void dispose() {
    _heightAnimationController.dispose();
    _iconRotationController.dispose();

    super.dispose();
  }

  // @override
  // void didUpdateWidget(covariant ExpandableDropdownButton<K> oldWidget) {
  //   super.didUpdateWidget(oldWidget);

  //   if (oldWidget.current != widget.current) {
  //     final index = widget.items.indexWhere((element) => element.key == _initialKey);
  //     if (index < 0) {
  //       throw Exception('Current key not found in items');
  //     }
  //     setState(() {
  //       _currentValue = widget.items[index].value;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    if (context.isDarkMode() && widget.darkBackgroundColor != null) {
      backgroundColor = widget.darkBackgroundColor;
    } else {
      backgroundColor = widget.backgroundColor;
    }

    Widget? arrowIcon;
    if (context.isDarkMode() && widget.darkDownArrowIcon != null) {
      arrowIcon = widget.darkDownArrowIcon;
    } else {
      arrowIcon = widget.downArrowIcon;
    }

    BoxBorder? border;
    if (context.isDarkMode() && widget.darkBorder != null) {
      border = widget.darkBorder;
    } else {
      border = widget.border;
    }

    TextStyle? selectedValueFontStyle;
    if (context.isDarkMode() && widget.darkSelectedValueFontStyle != null) {
      selectedValueFontStyle = widget.darkSelectedValueFontStyle;
    } else {
      selectedValueFontStyle = widget.selectedValueFontStyle;
    }

    TextStyle? itemsFontStyle;
    if (context.isDarkMode() && widget.darkItemsFontStyle != null) {
      itemsFontStyle = widget.darkItemsFontStyle;
    } else {
      itemsFontStyle = widget.itemsFontStyle;
    }

    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border,
        borderRadius: widget.borderRadius,
        boxShadow: widget.boxShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: _toggleContainer,
            behavior: HitTestBehavior.translucent,
            child: Container(
              padding: widget.padding,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _currentValue!,
                      style: selectedValueFontStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  // const Spacer(),
                  if (arrowIcon != null)
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 5.w),
                      child: AnimatedBuilder(
                        animation: _iconRotationAnimation,
                        child: arrowIcon,
                        builder: (context, child) => Transform.rotate(
                          angle: _iconRotationAnimation.value,
                          child: child,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: _heightAnimation,
            child: Column(
              children: [
                for (var i = 0; i < filteredItems.length; ++i)
                  Column(
                    children: [
                      if (i != 0 && widget.itemsDividerSideIndent != null)
                        PokedexScaffoldDivider(
                          indent: widget.itemsDividerSideIndent ?? 0,
                          endIndent: widget.itemsDividerSideIndent ?? 0,
                        ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          _chooseValue(filteredItems[i]);
                          if (widget.onItemSelect != null) {
                            widget.onItemSelect!(filteredItems[i].key);
                          }
                        },
                        child: Container(
                          padding: widget.itemsPadding,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FlexibleText(
                                filteredItems[i].value,
                                style: itemsFontStyle,
                                maxLines: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _chooseValue(DropdownItem chosenItem) {
    setState(() {
      // _currentKey = chosenItem.key;
      _currentValue = chosenItem.value;
    });

    _heightAnimationController.animateBack(0, duration: const Duration(milliseconds: 300));
    _iconRotationController.reverse();
  }

  void _toggleContainer() {
    if (_heightAnimation.status != AnimationStatus.completed) {
      _iconRotationController.forward();
      _heightAnimationController.forward();
    } else {
      _heightAnimationController.animateBack(0, duration: const Duration(milliseconds: 300));
      _iconRotationController.reverse();
    }
  }
}
