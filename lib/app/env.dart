import 'package:flutter/material.dart';

enum Flavor { DEV, TESTING, STAGING, PRODUCTION }

class FlavorValues {
  FlavorValues({
    required this.baseURL,
    required this.localDBName,
    required this.localDBPath,
  });

  String baseURL;
  String localDBName;
  String localDBPath;
}

class FlavorConfig {
  factory FlavorConfig({
    required Flavor flavor,
    required FlavorValues values,
    Color color = Colors.blue,
  }) {
    _instance ??=
        FlavorConfig._internal(flavor, flavor.toString(), color, values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);

  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;
  static FlavorConfig? _instance;
  static FlavorConfig? get instance {
    return _instance;
  }

  static bool isProduction() => _instance!.flavor == Flavor.PRODUCTION;
  static bool isDevelopment() => _instance!.flavor == Flavor.DEV;
  static bool isStaging() => _instance!.flavor == Flavor.STAGING;
  static bool isTesting() => _instance!.flavor == Flavor.TESTING;
}
