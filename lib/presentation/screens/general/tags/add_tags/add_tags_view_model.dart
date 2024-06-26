part of 'add_tags_imports.dart';

class AddTagsViewModel {
  final Repository repository;

  AddTagsViewModel({required this.repository});

  final VelocityBloc<bool> isLoading = VelocityBloc(false);
  final GlobalKey<FormState> addTagGlobalKey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController slugController = TextEditingController();

  void addTitleListener() {
    titleController.addListener(() {
      slugController.text =
          titleController.text.toLowerCase().replaceAll(" ", "-").trim();
    });
  }
  void dispose(){
    titleController.dispose();
  }

  Future<void> addNewTags(BuildContext context) async {
    if (!addTagGlobalKey.currentState!.validate()) {
      return;
    }
    isLoading.onUpdateData(true);
    await repository.tagsRepo
        .addTags(title: titleController.text, slug: slugController.text)
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
