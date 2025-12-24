import 'package:bookly/Core/router/router_name.dart';
import 'package:bookly/Features/Presentation/home/home_screen.dart';
import 'package:bookly/Features/Presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router() {
    return GoRouter(
      initialLocation: AppRoutes.splash,
      routes: [
        GoRoute(
          path: AppRoutes.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  }
}