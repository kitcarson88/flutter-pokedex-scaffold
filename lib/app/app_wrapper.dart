import 'package:flutter/material.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:pokedex_scaffold/configs/singleton_locator.dart';

class AppWrapper extends StatelessWidget {
  final Widget app;

  const AppWrapper({
    super.key,
    required this.app,
  });

  @override
  Widget build(BuildContext context) => HookedBlocConfigProvider(
        injector: () => locator.get,
        builderCondition: (state) => state != null, // Global build condition
        listenerCondition: (state) => state != null, // Global listen condition
        child: app,
      );
}
