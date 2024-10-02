import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> configureHydratedBloc() async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb ? HydratedStorage.webStorageDirectory : await getApplicationSupportDirectory(),
  );
}
