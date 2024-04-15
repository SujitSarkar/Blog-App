import 'auth_repo.dart';
import 'post_repo.dart';
import 'tags_repo.dart';

class Repository {
  Repository({required this.authRepo, required this.tagsRepo, required this.postRepo});

  final TagsRepo tagsRepo;
  final AuthRepo authRepo;
  final PostRepo postRepo;
}
