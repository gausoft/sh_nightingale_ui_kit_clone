// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:sh_nightingale_ui_kit_clone/src/pages/splash_loading/loading_interactive.dart'
    as _i2;
import 'package:sh_nightingale_ui_kit_clone/src/pages/splash_loading/loading_quote.dart'
    as _i3;
import 'package:sh_nightingale_ui_kit_clone/src/pages/splash_loading/splash_screen.dart'
    as _i5;
import 'package:sh_nightingale_ui_kit_clone/src/pages/welcome/home_page.dart'
    as _i1;
import 'package:sh_nightingale_ui_kit_clone/src/pages/welcome/onboarding_page.dart'
    as _i4;

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i6.PageRouteInfo<void> {
  const HomePageRoute({List<_i6.PageRouteInfo>? children})
    : super(HomePageRoute.name, initialChildren: children);

  static const String name = 'HomePageRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.LoadingInteractive]
class LoadingInteractive extends _i6.PageRouteInfo<void> {
  const LoadingInteractive({List<_i6.PageRouteInfo>? children})
    : super(LoadingInteractive.name, initialChildren: children);

  static const String name = 'LoadingInteractive';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoadingInteractive();
    },
  );
}

/// generated route for
/// [_i3.LoadingQuote]
class LoadingQuoteRoute extends _i6.PageRouteInfo<void> {
  const LoadingQuoteRoute({List<_i6.PageRouteInfo>? children})
    : super(LoadingQuoteRoute.name, initialChildren: children);

  static const String name = 'LoadingQuoteRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoadingQuote();
    },
  );
}

/// generated route for
/// [_i4.OnboardingPage]
class OnboardingPageRoute extends _i6.PageRouteInfo<void> {
  const OnboardingPageRoute({List<_i6.PageRouteInfo>? children})
    : super(OnboardingPageRoute.name, initialChildren: children);

  static const String name = 'OnboardingPageRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashScreen();
    },
  );
}
