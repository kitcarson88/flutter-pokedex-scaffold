FLUTTER_DIR=".fvm/flutter_sdk"
if [ -d "$FLUTTER_DIR" ]; then
  FLUTTER_CMD=".fvm/flutter_sdk/bin/flutter"
else
  FLUTTER_CMD="flutter"
fi

$FLUTTER_CMD pub run flutter_flavorizr
