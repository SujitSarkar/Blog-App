part of 'tags_imports.dart';

class TagsViewModel {
  final Repository repository;

  TagsViewModel({required this.repository});

  final VelocityBloc<bool> isLoading = VelocityBloc(false);
  final VelocityBloc<List<TagsModel>> tagsListBloc = VelocityBloc<List<TagsModel>>([]);

  Future<void> fetchAllTags() async {
    List<TagsModel> result = await repository.tagsRepo.getAllTags();
    if (result.isNotEmpty) {
      tagsListBloc.onUpdateData(result);
    }
  }

  Future<void> goToAddTagsPage(BuildContext context) async {
    final List<TagsModel>? newTagsList = await AutoRouter.of(context)
        .push<List<TagsModel>>(const AddTagsRoute());
    if(newTagsList!=null){
      tagsListBloc.onUpdateData(newTagsList);
    }
  }
  Future<void> goToUpdateTagPage(BuildContext context, {required TagsModel tagModel}) async {
    final List<TagsModel>? newTagsList = await AutoRouter.of(context)
        .push<List<TagsModel>>(UpdateTagRoute(tagModel: tagModel));
    if(newTagsList!=null){
      tagsListBloc.onUpdateData(newTagsList);
    }
  }

  Future<void> deleteTags(BuildContext context, {required String tagId})async{
    isLoading.onUpdateData(true);
    final result = await repository.tagsRepo.deleteTags(tagId: tagId);
    if(result.status==1){
      await repository.tagsRepo.getAllTags().then((newTags){
        tagsListBloc.onUpdateData(newTags);
        VxToast.show(context, msg: result.message??'');
        Navigator.pop(context);
      });
    }
    isLoading.onUpdateData(false);
  }
}
