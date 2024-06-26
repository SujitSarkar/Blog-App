import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_bloc/cubit/velocity_cubit/velocity_cubit.dart';

import '../../../../core/router/router_imports.gr.dart';
import '../../../../data/repositories/repository.dart';
import '../../../../presentation/screens/general/add_posts/widgets/widget_imports.dart';

import '../../../../presentation/widgets/widgets_imports.dart';

import '../../../../core/constants/app_colors.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../core/constants/app_assets.dart';
import '../categories/categories_model.dart';
import '../tags/tags_model.dart';

part 'add_posts.dart';
part 'add_posts_view_model.dart';
