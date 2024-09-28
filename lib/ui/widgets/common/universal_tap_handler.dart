import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UniversalTapHandler extends RawGestureDetector {
  UniversalTapHandler({
    super.key,
    required GestureTapCallback? onTap,
    GestureTapUpCallback? onTapUp,
    GestureTapDownCallback? onTapDown,
    required Widget super.child,
  }) : super(
          gestures: <Type, GestureRecognizerFactory>{
            _UniversalPointerHandler:
                GestureRecognizerFactoryWithHandlers<_UniversalPointerHandler>(
              () => _UniversalPointerHandler(onTap: onTap, onTapUp: onTapUp, onTapDown: onTapDown),
              (_) {},
            ),
          },
        );
}

class _UniversalPointerHandler extends OneSequenceGestureRecognizer {
  final GestureTapCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;

  final _maxDistance = 18; // as in official recognizer by default
  Offset? _startPosition;

  _UniversalPointerHandler({
    required this.onTap,
    this.onTapUp,
    this.onTapDown,
  }) : super();

  @override
  void addPointer(PointerDownEvent event) {
    if (onTap == null && onTapUp == null && onTapDown == null) {
      rejectGesture(event.pointer);
      _reset();
      return;
    }

    _startPosition = event.position;
    startTrackingPointer(event.pointer);
    resolve(GestureDisposition.accepted);

    if (onTapDown != null) {
      onTapDown!(TapDownDetails());
    }
  }

  @override
  String get debugDescription => '_UniversalPointerHandler: Custom Gesture Recognizer';

  @override
  void didStopTrackingLastPointer(int pointer) {}

  @override
  void handleEvent(PointerEvent event) {
    if (onTap == null && onTapUp == null && onTapDown == null) {
      rejectGesture(event.pointer);
      _reset();
      return;
    }

    if (event is PointerUpEvent) {
      stopTrackingPointer(event.pointer);
      if (_startPosition != null) {
        if (onTapUp != null) {
          onTapUp!(TapUpDetails(kind: PointerDeviceKind.touch));
        } else if (onTap != null) {
          onTap!();
        }
      }
    }
    if (event is PointerMoveEvent && _startPosition != null) {
      if ((event.position - _startPosition!).distance > _maxDistance) {
        rejectGesture(event.pointer);

        if (onTapUp != null) {
          onTapUp!(TapUpDetails(kind: PointerDeviceKind.touch));
        }

        _reset();
      }
    }
    if (event is PointerCancelEvent || event is PointerExitEvent || event is PointerRemovedEvent) {
      if (onTapUp != null) {
        onTapUp!(TapUpDetails(kind: PointerDeviceKind.touch));
      }

      _reset();
    }
  }

  @override
  void resolve(GestureDisposition disposition) {
    if (disposition == GestureDisposition.rejected) {
      _reset();
    }
    super.resolve(disposition);
  }

  void _reset() {
    _startPosition = null;
  }
}
