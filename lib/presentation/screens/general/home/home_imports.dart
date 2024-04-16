import 'package:auto_route/auto_route.dart';
import 'package:blog_app/data/repositories/repository.dart';
import 'package:blog_app/presentation/screens/general/home/home_model.dart';
import 'package:blog_app/presentation/widgets/widgets_imports.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import 'widgets/widget_imports.dart';

part 'home.dart';
part 'home_details.dart';
part 'home_view_model.dart';
