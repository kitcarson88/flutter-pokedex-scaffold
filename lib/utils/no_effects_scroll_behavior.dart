import 'package:flutter/widgets.dart';

class NoEffectsScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) =>
      child;
}
