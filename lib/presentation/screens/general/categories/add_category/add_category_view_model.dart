part of 'add_category_imports.dart';

class AddCategoryViewModel{
  final Repository repository;

  AddCategoryViewModel({required this.repository});

  final VelocityBloc<bool> isLoading = VelocityBloc(false);
  final GlobalKey<FormState> addCategoryGlobalKey = GlobalKey();
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

  Future<void> addNewCategory(BuildContext context) async {
    if (!addCategoryGlobalKey.currentState!.validate()) {
      return;
    }
    isLoading.onUpdateData(true);
    await repository.categoryRepo
        .addCategory(title: titleController.text, slug: slugController.text)
        .then((result) async{
      if (result.status == 1) {
        await repository.categoryRepo.getAllCategories().then((allCategory){
          VxToast.show(context, msg: result.message ?? '');
          AutoRouter.of(context).popForced<List<CategoryModel>>(allCategory);
        });
      }
    });
    isLoading.onUpdateData(false);
  }
}