import 'package:pokedex_scaffold/ui/styles/colors.gen.dart';
import 'package:pokedex_scaffold/ui/widgets/common/ws_refresh_indicator.dart';

class PokedexScaffoldWsRefreshIndicator extends WsRefreshIndicator {
  const PokedexScaffoldWsRefreshIndicator({
    super.key,
    required super.child,
    required super.onRefresh,
  }) : super(
          color: AppColors.primary,
          darkColor: AppColors.cF5F6F7,
          backgroundColor: AppColors.cF5F6F7,
          darkBackgroundColor: AppColors.darkPrimary,
        );
}
