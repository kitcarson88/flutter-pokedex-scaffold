import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

// this.mobileSmall = 320,
// this.mobileNormal = 375,
// this.mobileLarge = 414,
// this.mobileExtraLarge = 480,
// this.tabletSmall = 600,
// this.tabletNormal = 768,
// this.tabletLarge = 850,
// this.tabletExtraLarge = 900,
// this.desktopSmall = 950,
// this.desktopNormal = 1920,
// this.desktopLarge = 3840,
// this.desktopExtraLarge = 4096

// const _kSmallHeight = 480;
const _kNormalHeight = 640;
const _kBigHeight = 700;

class ResponsivenessUtils {
  static T getValueForScreenType<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
    T? watch,
  }) {
    var deviceScreenType = getDeviceType(MediaQuery.of(context).size);
    // If we're at desktop size
    if (deviceScreenType == DeviceScreenType.desktop) {
      // If we have supplied the desktop layout then display that
      if (desktop != null) return desktop;
      // If no desktop layout is supplied we want to check if we have the size below it and display that
      if (tablet != null) return tablet;
    }

    if (deviceScreenType == DeviceScreenType.tablet) {
      if (tablet != null) return tablet;
    }

    if (deviceScreenType == DeviceScreenType.watch && watch != null) {
      return watch;
    }

    // If none of the layouts above are supplied or we're on the mobile layout then we show the mobile layout
    return mobile;
  }

  static T getValueForRefinedSize<T>(
    BuildContext context, {
    required T normal,
    T? small,
    T? large,
    T? extraLarge,
  }) {
    var refinedSize = getRefinedSize(MediaQuery.of(context).size);
    // If we're at extra large size
    if (refinedSize == RefinedSize.extraLarge) {
      // If we have supplied the extra large layout then display that
      if (extraLarge != null) return extraLarge;
      // If no extra large layout is supplied we want to check if we have the size below it and display that
      if (large != null) return large;
    }

    if (refinedSize == RefinedSize.large) {
      // If we have supplied the large layout then display that
      if (large != null) return large;
      // If no large layout is supplied we want to check if we have the size below it and display that
      if (normal != null) return normal;
    }

    if (refinedSize == RefinedSize.small && small != null) {
      return small;
    }

    // If none of the layouts above are supplied or we're on the normal size layout then we show the normal layout
    return normal;
  }

  static T getValueForDeviceRefinedSize<T>(
    BuildContext context, {
    required T mobileNormal,
    T? watch,
    T? mobileSmall,
    T? mobileLarge,
    T? mobileExtraLarge,
    T? tabletSmall,
    T? tabletNormal,
    T? tabletLarge,
    T? tabletExtraLarge,
    T? desktopSmall,
    T? desktopNormal,
    T? desktopLarge,
    T? desktopExtraLarge,
  }) {
    var deviceScreenType = getDeviceType(MediaQuery.of(context).size);

    if (deviceScreenType == DeviceScreenType.desktop) {
      return getValueForRefinedSize(
        context,
        normal: desktopNormal ?? mobileNormal,
        small: desktopSmall,
        large: desktopLarge,
        extraLarge: desktopExtraLarge,
      );
    }

    if (deviceScreenType == DeviceScreenType.tablet) {
      return getValueForRefinedSize(
        context,
        normal: tabletNormal ?? mobileNormal,
        small: tabletSmall,
        large: tabletLarge,
        extraLarge: tabletExtraLarge,
      );
    }

    if (deviceScreenType == DeviceScreenType.watch && watch != null) {
      return watch;
    }

    return getValueForRefinedSize(
      context,
      normal: mobileNormal,
      small: mobileSmall,
      large: mobileLarge,
      extraLarge: mobileExtraLarge,
    );
  }

  static T getValueForRefinedHeight<T>(
    BuildContext context, {
    required T normalHeight,
    T? smallHeight,
    T? bigHeight,
  }) {
    var height = MediaQuery.of(context).size.height;

    if (bigHeight != null && height >= _kBigHeight) {
      return bigHeight;
    }

    if (smallHeight != null && height < _kNormalHeight) {
      return smallHeight;
    }

    return normalHeight;
  }
}
