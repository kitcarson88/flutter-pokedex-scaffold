import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_scaffold/constants/constants.dart' as constants;

enum Flavor {
  dev._('dev'),
  qa._('qa'),
  prod._('prod');

  final String _type;

  const Flavor._(String type) : _type = type;

  factory Flavor.fromType(String type) {
    if (type.toLowerCase() == 'dev') {
      return Flavor.dev;
    } else if (type.toLowerCase() == 'qa') {
      return Flavor.qa;
    } else {
      return Flavor.prod;
    }
  }

  String get type => _type;

  String toShortString() => toString().split('.').last;
}

class F {
  static const String _environmentFlavor = String.fromEnvironment('FLAVOR', defaultValue: 'prod');

  static Flavor? get appFlavor => Flavor.fromType(_environmentFlavor);

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return '[D] Pokedex Scaffold';
      case Flavor.qa:
        return '[T] Pokedex Scaffold';
      case Flavor.prod:
        return 'Pokedex Scaffold';
      default:
        return 'title';
    }
  }

  static Color get color {
    switch (appFlavor) {
      case Flavor.dev:
        return Colors.green;
      case Flavor.qa:
        return Colors.yellow;
      case Flavor.prod:
        return Colors.red;
      default:
        return Colors.transparent;
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return '';
      case Flavor.qa:
        return '';
      case Flavor.prod:
        return '';
      default:
        return '';
    }
  }

  static String get baseVersion {
    switch (appFlavor) {
      case Flavor.dev:
        return '';
      case Flavor.qa:
        return '';
      case Flavor.prod:
        return '';
      default:
        return '';
    }
  }

  static bool isDev() => appFlavor! == Flavor.dev;
  static bool isTest() => appFlavor! == Flavor.qa;
  static bool isProd() => appFlavor! == Flavor.prod;

  static String locatorEnvironment() {
    if (constants.enableApiMocks) {
      return 'mock';
    } else {
      switch (appFlavor) {
        case Flavor.dev:
          return Environment.dev;
        case Flavor.qa:
          return Environment.test;
        case Flavor.prod:
          return Environment.prod;
        default:
          return Environment.prod;
      }
    }
  }
}

const mock = Environment('mock');
