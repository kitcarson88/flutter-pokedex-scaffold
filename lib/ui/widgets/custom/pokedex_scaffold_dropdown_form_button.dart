import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:pokedex_scaffold/ui/widgets/custom/pokedex_scaffold_dropdown_button.dart';

class PokedexScaffoldDropdownFormButton<T> extends FormBuilderField<T> {
  PokedexScaffoldDropdownFormButton({
    super.key,
    required super.name,
    super.focusNode,
    super.initialValue,
    super.validator,
    super.enabled,
    super.autovalidateMode,
    super.onSaved,
    super.restorationId,
    String? title,
    required List<PokedexScaffoldDropdownItem<T>> items,
    final void Function(T?)? onItemSelect,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? itemsPadding,
  }) : super(
          builder: (state) => PokedexScaffoldDropdownButton<T>(
            title: title,
            current: initialValue,
            items: items,
            onItemSelect: (value) {
              if (value != null) {
                state.didChange(value);
              }

              if (onItemSelect != null) {
                onItemSelect(value);
              }
            },
            padding: padding,
            margin: margin,
            itemsPadding: itemsPadding,
          ),
        );
}
