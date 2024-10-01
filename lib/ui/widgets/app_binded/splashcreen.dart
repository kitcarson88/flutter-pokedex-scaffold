import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/constants/constants.dart' as constants;
import 'package:pokedex_scaffold/ui/styles/assets.gen.dart';
import 'package:pokedex_scaffold/ui/styles/colors.gen.dart';
import 'package:pokedex_scaffold/ui/styles/theme.dart';

class Splashcreen extends StatefulWidget {
  const Splashcreen({super.key});

  @override
  State<Splashcreen> createState() => _SplashcreenState();
}

class _SplashcreenState extends State<Splashcreen> with TickerProviderStateMixin {
  static const _kTitle = 'Pokedex Scaffold';

  late final AnimationController _fadeInAnimationController;
  late final Animation<double> _fadeInAnimation;
  late final AnimationController _fadeOutAnimationController;
  late final Animation<double> _fadeOutAnimation;

  @override
  void initState() {
    super.initState();

    _fadeInAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeInAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeInAnimationController,
      curve: Curves.easeInOut,
    ));

    _fadeOutAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeOutAnimation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _fadeOutAnimationController,
      curve: Curves.easeInOut,
    ));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fadeInAnimationController.forward();
    });
    Future.delayed(const Duration(milliseconds: constants.splashDurationInMilliseconds)).then((_) {
      _fadeOutAnimationController.forward();
    });
  }

  @override
  void dispose() {
    _fadeInAnimationController.dispose();
    _fadeOutAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: _fadeOutAnimation,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                color: AppTheme.splashPrimary(context),
              ),
              FadeTransition(
                opacity: _fadeInAnimation,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        AppTheme.splashPrimary(context),
                        AppTheme.splashSecondary(context),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.images.splashLogo.image(
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Stack(
                          children: [
                            Text(
                              _kTitle,
                              style: AppTheme.s40w700h20cPrimary(context).copyWith(
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 4
                                  ..color = AppColors.tertiary,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              _kTitle,
                              style: AppTheme.s40w700h20cPrimary(context),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
