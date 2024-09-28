import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// ignore: always_use_package_imports
import './singleton_locator.config.dart';

GetIt locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void setupLocator() {
  locator.init();
}
