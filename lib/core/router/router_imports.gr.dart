// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:blog_app/presentation/screens/auth/auth_imports.dart' as _i3;
import 'package:blog_app/presentation/screens/auth/login/login_imports.dart'
    as _i7;
import 'package:blog_app/presentation/screens/auth/register/register_imports.dart'
    as _i9;
import 'package:blog_app/presentation/screens/general/categories/add_category/add_category_imports.dart'
    as _i1;
import 'package:blog_app/presentation/screens/general/categories/categories_imports.dart'
    as _i4;
import 'package:blog_app/presentation/screens/general/categories/categories_model.dart'
    as _i15;
import 'package:blog_app/presentation/screens/general/categories/update_category/update_category_imports.dart'
    as _i12;
import 'package:blog_app/presentation/screens/general/general_imports.dart'
    as _i5;
import 'package:blog_app/presentation/screens/general/home/home_imports.dart'
    as _i6;
import 'package:blog_app/presentation/screens/general/home/home_model.dart'
    as _i18;
import 'package:blog_app/presentation/screens/general/tags/add_tags/add_tags_imports.dart'
    as _i2;
import 'package:blog_app/presentation/screens/general/tags/tags_imports.dart'
    as _i11;
import 'package:blog_app/presentation/screens/general/tags/tags_model.dart'
    as _i16;
import 'package:blog_app/presentation/screens/general/tags/update_tag/update_tag_imports.dart'
    as _i13;
import 'package:blog_app/presentation/screens/onboard/onboard_imports.dart'
    as _i8;
import 'package:blog_app/presentation/screens/splash/splash_imports.dart'
    as _i10;
import 'package:flutter/material.dart' as _i17;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    AddCategoryRoute.name: (routeData) {
      return _i14.AutoRoutePage<List<_i15.CategoryModel>>(
        routeData: routeData,
        child: const _i1.AddCategory(),
      );
    },
    AddTagsRoute.name: (routeData) {
      return _i14.AutoRoutePage<List<_i16.TagsModel>>(
        routeData: routeData,
        child: const _i2.AddTags(),
      );
    },
    AuthRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Auth(),
      );
    },
    CategoriesRoute.name: (routeData) {
      return _i14.AutoRoutePage<_i15.CategoryModel>(
        routeData: routeData,
        child: const _i4.Categories(),
      );
    },
    GeneralRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.General(),
      );
    },
    HomeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDetailsRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.HomeDetails(
          key: args.key,
          homeModel: args.homeModel,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.Login(),
      );
    },
    OnBoardRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.OnBoard(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Register(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.Splash(),
      );
    },
    TagsRoute.name: (routeData) {
      return _i14.AutoRoutePage<_i16.TagsModel>(
        routeData: routeData,
        child: const _i11.Tags(),
      );
    },
    UpdateCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateCategoryRouteArgs>();
      return _i14.AutoRoutePage<List<_i15.CategoryModel>>(
        routeData: routeData,
        child: _i12.UpdateCategory(
          key: args.key,
          categoryModel: args.categoryModel,
        ),
      );
    },
    UpdateTagRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateTagRouteArgs>();
      return _i14.AutoRoutePage<List<_i16.TagsModel>>(
        routeData: routeData,
        child: _i13.UpdateTag(
          key: args.key,
          tagModel: args.tagModel,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddCategory]
class AddCategoryRoute extends _i14.PageRouteInfo<void> {
  const AddCategoryRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AddCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddCategoryRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddTags]
class AddTagsRoute extends _i14.PageRouteInfo<void> {
  const AddTagsRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AddTagsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTagsRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Auth]
class AuthRoute extends _i14.PageRouteInfo<void> {
  const AuthRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i4.Categories]
class CategoriesRoute extends _i14.PageRouteInfo<void> {
  const CategoriesRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i5.General]
class GeneralRoute extends _i14.PageRouteInfo<void> {
  const GeneralRoute({List<_i14.PageRouteInfo>? children})
      : super(
          GeneralRoute.name,
          initialChildren: children,
        );

  static const String name = 'GeneralRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeDetails]
class HomeDetailsRoute extends _i14.PageRouteInfo<HomeDetailsRouteArgs> {
  HomeDetailsRoute({
    _i17.Key? key,
    required _i18.HomeModel homeModel,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          HomeDetailsRoute.name,
          args: HomeDetailsRouteArgs(
            key: key,
            homeModel: homeModel,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDetailsRoute';

  static const _i14.PageInfo<HomeDetailsRouteArgs> page =
      _i14.PageInfo<HomeDetailsRouteArgs>(name);
}

class HomeDetailsRouteArgs {
  const HomeDetailsRouteArgs({
    this.key,
    required this.homeModel,
  });

  final _i17.Key? key;

  final _i18.HomeModel homeModel;

  @override
  String toString() {
    return 'HomeDetailsRouteArgs{key: $key, homeModel: $homeModel}';
  }
}

/// generated route for
/// [_i7.Login]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute({List<_i14.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i8.OnBoard]
class OnBoardRoute extends _i14.PageRouteInfo<void> {
  const OnBoardRoute({List<_i14.PageRouteInfo>? children})
      : super(
          OnBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Register]
class RegisterRoute extends _i14.PageRouteInfo<void> {
  const RegisterRoute({List<_i14.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i10.Splash]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Tags]
class TagsRoute extends _i14.PageRouteInfo<void> {
  const TagsRoute({List<_i14.PageRouteInfo>? children})
      : super(
          TagsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TagsRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i12.UpdateCategory]
class UpdateCategoryRoute extends _i14.PageRouteInfo<UpdateCategoryRouteArgs> {
  UpdateCategoryRoute({
    _i17.Key? key,
    required _i15.CategoryModel categoryModel,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          UpdateCategoryRoute.name,
          args: UpdateCategoryRouteArgs(
            key: key,
            categoryModel: categoryModel,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateCategoryRoute';

  static const _i14.PageInfo<UpdateCategoryRouteArgs> page =
      _i14.PageInfo<UpdateCategoryRouteArgs>(name);
}

class UpdateCategoryRouteArgs {
  const UpdateCategoryRouteArgs({
    this.key,
    required this.categoryModel,
  });

  final _i17.Key? key;

  final _i15.CategoryModel categoryModel;

  @override
  String toString() {
    return 'UpdateCategoryRouteArgs{key: $key, categoryModel: $categoryModel}';
  }
}

/// generated route for
/// [_i13.UpdateTag]
class UpdateTagRoute extends _i14.PageRouteInfo<UpdateTagRouteArgs> {
  UpdateTagRoute({
    _i17.Key? key,
    required _i16.TagsModel tagModel,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          UpdateTagRoute.name,
          args: UpdateTagRouteArgs(
            key: key,
            tagModel: tagModel,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateTagRoute';

  static const _i14.PageInfo<UpdateTagRouteArgs> page =
      _i14.PageInfo<UpdateTagRouteArgs>(name);
}

class UpdateTagRouteArgs {
  const UpdateTagRouteArgs({
    this.key,
    required this.tagModel,
  });

  final _i17.Key? key;

  final _i16.TagsModel tagModel;

  @override
  String toString() {
    return 'UpdateTagRouteArgs{key: $key, tagModel: $tagModel}';
  }
}
