part of 'tags_imports.dart';

class TagsViewModel {
  final Repository repository;
  TagsViewModel({required this.repository});

  final VelocityBloc<List<TagsModel>> tagsListBloc =
      VelocityBloc<List<TagsModel>>([]);

  Future<void> fetchAllTags() async {
    List<TagsModel> result = await repository.tagsRepo.getAllTags();
    if (result.isNotEmpty) {
      tagsListBloc.onUpdateData(result);
    }
  }
}
