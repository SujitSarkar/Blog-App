import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_strings.dart';
import '../../core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'core/router/router_imports.dart';
import 'data/repositories/auth_repo.dart';
import 'data/repositories/category_repo.dart';
import 'data/repositories/post_repo.dart';
import 'data/repositories/repository.dart';
import 'data/repositories/tags_repo.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => Repository(
      tagsRepo: TagsRepo(),
      authRepo: AuthRepo(),
      postRepo: PostRepo(),
      categoryRepo: CategoryRepo()
    ),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: ThemeMode.light,
            routerConfig: _appRouter.config(),
          );
        });
  }
}
