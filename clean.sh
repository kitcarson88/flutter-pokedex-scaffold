FLUTTER_DIR=".fvm/flutter_sdk"
if [ -d "$FLUTTER_DIR" ]; then
  FLUTTER_CMD=".fvm/flutter_sdk/bin/flutter"
else
  FLUTTER_CMD="flutter"
fi

dart run build_runner clean
$FLUTTER_CMD clean

find . -name '*.freezed.dart' -delete
find . -name '*.g.dart' -delete
find . -name '*.gr.dart' -delete
find . -name '*.gen.dart' -delete

find . -name 'pubspec.lock' -delete
find . -name 'mason-lock.json' -delete
find . -name '.packages' -delete
find . -name '.dart_tool' -prune -exec rm -rf {} \;
