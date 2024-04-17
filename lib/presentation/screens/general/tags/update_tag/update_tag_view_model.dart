part of 'update_tag_imports.dart';

class UpdateTagViewModel{
  final Repository repository;
  UpdateTagViewModel({required this.repository});

  final VelocityBloc<bool> isLoading = VelocityBloc(false);
  final GlobalKey<FormState> updateTagGlobalKey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController slugController = TextEditingController();

  void updateTitleListener(String tagTitle) {
    titleController.text = tagTitle;
    slugController.text = titleController.text.toLowerCase().replaceAll(" ", "-").trim();
    titleController.addListener(() {
      slugController.text =
          titleController.text.toLowerCase().replaceAll(" ", "-").trim();
    });
  }
  void dispose(){
    titleController.dispose();
  }

  Future<void> updateTag(BuildContext context, {required String tagId}) async {
    if (!updateTagGlobalKey.currentState!.validate()) {
      return;
    }
    isLoading.onUpdateData(true);
    await repository.tagsRepo
        .updateTag(tagId: tagId, title: titleController.text, slug: slugController.text)
        .then((result) async{
      if (result.status == 1) {
        await repository.tagsRepo.getAllTags().then((allTags){
          VxToast.show(context, msg: result.message ?? '');
          AutoRouter.of(context).popForced<List<TagsModel>>(allTags);
        });
      }
    });
    isLoading.onUpdateData(false);
  }
}