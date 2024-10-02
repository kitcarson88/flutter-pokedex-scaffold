# git submodule init
# git pull --recurse

FLUTTER_DIR=".fvm/flutter_sdk"
if [ -d "$FLUTTER_DIR" ]; then
  FLUTTER_CMD=".fvm/flutter_sdk/bin/flutter"
  FLUTTER_CMD_ON_BACK_DIR="../.fvm/flutter_sdk/bin/flutter"
else
  FLUTTER_CMD="flutter"
  FLUTTER_CMD_ON_BACK_DIR="flutter"
fi

echo "Initializing project with following flutter version:"
$FLUTTER_CMD --version

$FLUTTER_CMD pub get

dart run build_runner build --delete-conflicting-outputs
$FLUTTER_CMD gen-l10n

# cd ios
# $FLUTTER_CMD_ON_BACK_DIR precache --ios
# pod install
# cd ..