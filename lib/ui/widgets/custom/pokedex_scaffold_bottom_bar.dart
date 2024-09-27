import 'package:fancy_bottom_tab_bar/fancy_bottom_tab_bar.dart';
import 'package:flutter/material.dart';

class PokedexScaffoldBottomBar extends FancyBottomTabBar {
  PokedexScaffoldBottomBar({
    super.key,
    required void Function(int) onItemTap,
  }) : super(
          icons: [
            const Icon(Icons.abc),
            const Icon(Icons.ac_unit),
            const Icon(Icons.access_alarm),
            const Icon(Icons.access_time),
          ],
          initialSelectedIndex: 0,
          onItemTap: onItemTap,
        );
}
