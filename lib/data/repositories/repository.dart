import 'package:blog_app/data/repositories/category_repo.dart';

import 'auth_repo.dart';
import 'post_repo.dart';
import 'tags_repo.dart';

class Repository {
  Repository({required this.authRepo, required this.tagsRepo, required this.postRepo, required this.categoryRepo,});

  final TagsRepo tagsRepo;
  final AuthRepo authRepo;
  final PostRepo postRepo;
  final CategoryRepo categoryRepo;
}
