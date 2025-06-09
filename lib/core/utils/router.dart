import 'package:go_router/go_router.dart';
import 'package:ulearna/presentation/reels_home/page/reels_page.dart';

class Approuter {
  final router = GoRouter(initialLocation: '/reel_home', routes: [
    GoRoute(
      path: "/reel_home",
      name: 'reel_home',
      builder: (context, state) => ReelsPage(),
    ),
  ]);
}
