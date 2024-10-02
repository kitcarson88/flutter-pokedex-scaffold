import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/core/base/base_modal.dart';

class NestedNavigationModal extends BaseModal {
  final Widget view;

  const NestedNavigationModal({
    super.key,
    required this.view,
  }) : super(
          useModalIndicator: false,
          useNestedNavigation: true,
        );

  @override
  Widget body(BuildContext context) => view;
}
