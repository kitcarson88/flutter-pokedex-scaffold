import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appBuilder(BuildContext context, Widget? child) {
  ScreenUtil.init(
    context,
    designSize: const Size(411, 960),
    minTextAdapt: true,
    splitScreenMode: true,
  );

  final builder = AppBuilder(child: child!);

  return builder;
}

class AppBuilder extends StatelessWidget {
  final Widget child;

  const AppBuilder({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => child;
}
