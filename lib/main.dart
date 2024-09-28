import 'package:pokedex_scaffold/app/app.dart';
import 'package:pokedex_scaffold/app/app_wrapper.dart';
import 'package:pokedex_scaffold/bootstrap.dart';

void main() {
  bootstrap(() => const AppWrapper(
        app: App(),
      ));
}
