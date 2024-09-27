import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FavoritesView extends StatelessWidget {
  const FavoritesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('Favorites view'),
        ),
      );
}
