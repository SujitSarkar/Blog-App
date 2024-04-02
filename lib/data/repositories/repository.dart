import 'package:blog_app/data/repositories/auth_repo.dart';

import 'tags_repo.dart';

class Repository {
  Repository({required this.authRepo, required this.tagsRepo});

  final TagsRepo tagsRepo;
  final AuthRepo authRepo;
}
