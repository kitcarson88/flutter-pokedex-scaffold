import 'package:flutter/material.dart';
import 'package:pokedex_scaffold/core/base/base_button.dart';
import 'package:pokedex_scaffold/ui/widgets/common/universal_tap_handler.dart';

mixin BouncingButtonAnimation on BaseButtonState, TickerProvider {
  static const _kAnimationMilliseconds = 500;

  double _scale = 1;
  AnimationController? _controller;

  int animationMilliseconds = _kAnimationMilliseconds;

  void setAnimationMilliseconds(int milliseconds) {
    animationMilliseconds = milliseconds;
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: animationMilliseconds,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {
          _scale = 1 - _controller!.value;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => super.widget.onPressed != null
      ? UniversalTapHandler(
          onTap: null,
          onTapDown: (details) {
            _controller?.forward();
          },
          onTapUp: (details) {
            _controller?.reverse();
          },
          child: Transform.scale(
            scale: _scale,
            child: super.build(context),
          ),
        )
      : super.build(context);
}
