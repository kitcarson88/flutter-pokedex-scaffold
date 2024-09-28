import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NestedRoutingKeyService {
  final Map<String, GlobalKey<AutoRouterState>> _keysMap = {};

  GlobalKey<AutoRouterState> createNavigationKey(String key) {
    if (!_keysMap.containsKey(key)) {
      _keysMap[key] = GlobalKey<AutoRouterState>();
    }

    return getNavigationKey(key)!;
  }

  GlobalKey<AutoRouterState>? getNavigationKey(String key) => _keysMap[key];

  void deleteNavigationKey(String key) {
    _keysMap.remove(key);
  }
}
