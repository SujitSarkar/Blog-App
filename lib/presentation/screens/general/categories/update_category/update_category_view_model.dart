part of 'update_category_imports.dart';

class UpdateCategoryViewModel{
  final Repository repository;

  UpdateCategoryViewModel({required this.repository});

  final VelocityBloc<bool> isLoading = VelocityBloc(false);
  final GlobalKey<FormState> updateCategoryGlobalKey = GlobalKey();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController slugController = TextEditingController();

  void updateTitleListener(String categoryTitle) {
    titleController.text = categoryTitle;
    slugController.text = titleController.text.toLowerCase().replaceAll(" ", "-").trim();
    titleController.addListener(() {
      slugController.text =
          titleController.text.toLowerCase().replaceAll(" ", "-").trim();
    });
  }
  void dispose(){
    titleController.dispose();
  }

  Future<void> updateCategory(BuildContext context, {required String id}) async {
    if (!updateCategoryGlobalKey.currentState!.validate()) {
      return;
    }
    isLoading.onUpdateData(true);
    await repository.categoryRepo
        .updateCategory(id: id, title: titleController.text, slug: slugController.text)
        .then((result) async{
      if (result.status == 1) {
        await repository.categoryRepo.getAllCategories().then((allCategories){
          VxToast.show(context, msg: result.message ?? '');
          AutoRouter.of(context).popForced<List<CategoryModel>>(allCategories);
        });
      }
    });
    isLoading.onUpdateData(false);
  }
}