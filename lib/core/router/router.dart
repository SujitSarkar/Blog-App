part of 'router_imports.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: '/', initial: true),
        AutoRoute(page: OnBoardRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: GeneralRoute.page),
        AutoRoute(page: HomeDetailsRoute.page),
        AutoRoute(page: TagsRoute.page),
        AutoRoute(page: AddTagsRoute.page),
        AutoRoute(page: UpdateTagRoute.page),
        AutoRoute(page: CategoriesRoute.page),
        AutoRoute(page: AddCategoryRoute.page),
        AutoRoute(page: UpdateCategoryRoute.page),
      ];
}
