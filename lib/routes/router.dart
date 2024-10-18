import 'package:go_router/go_router.dart';
import 'package:nurse_department/resource/resource.dart';

class Introduce {
  static const intro = '/introduce/intro';
}

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: Introduce.intro,
      builder: (context, state) => const IntroPage(),
    ),
  ],
);
