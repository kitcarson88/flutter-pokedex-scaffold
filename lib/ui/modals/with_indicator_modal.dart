import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/core/base/base_modal.dart';

class WithIndicatorModal extends BaseModal {
  final Widget view;

  const WithIndicatorModal({
    super.key,
    required this.view,
  });

  @override
  Widget body(BuildContext context) => SingleChildScrollView(
        child: view,
      );
}
