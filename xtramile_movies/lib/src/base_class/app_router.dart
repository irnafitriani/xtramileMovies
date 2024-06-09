import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter implements AutoRouteGuard {
  // Guarding all stack-routes
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    resolver.next();
  }

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/genre-view',
      page: GenreView.page,
      initial: true,
    ),
    AutoRoute(
      path: '/movie-list-view',
      page: MovieListView.page,
      initial: false,
    ),
    AutoRoute(
      path: '/movie-detail',
      page: MovieDetailView.page,
      initial: false,
    ),
    AutoRoute(
      path: '/user-review-list',
      page: UserReviewView.page,
      initial: false,
    ),
     AutoRoute(
      path: '/trailer-view',
      page: TrailerView.page,
      initial: false,
    ),
  ];
}
