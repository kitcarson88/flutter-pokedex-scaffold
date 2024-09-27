import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UseCasesRoutingView extends StatelessWidget {
  const UseCasesRoutingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('Use Cases Routing View'),
        ),
      );
}
