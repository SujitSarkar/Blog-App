part of 'categories_imports.dart';

class CategoriesViewModel{
  final Repository repository;
  CategoriesViewModel({required this.repository});

  final VelocityBloc<bool> isLoading = VelocityBloc(false);
  VelocityBloc<List<CategoryModel>> categoryListBloc = VelocityBloc([]);

  Future<void> fetchAllCategory() async {
    List<CategoryModel> result = await repository.categoryRepo.getAllCategories();
    if (result.isNotEmpty) {
      categoryListBloc.onUpdateData(result);
    }
  }

  Future<void> goToAddCategoryPage(BuildContext context) async {
    final List<CategoryModel>? newCategoryList = await AutoRouter.of(context)
        .push<List<CategoryModel>>(const AddCategoryRoute());
    if(newCategoryList!=null){
      categoryListBloc.onUpdateData(newCategoryList);
    }
  }

  Future<void> goToUpdateCategoryPage(BuildContext context, {required CategoryModel categoryModel}) async {
    final List<CategoryModel>? newCategoryList = await AutoRouter.of(context)
        .push<List<CategoryModel>>(UpdateCategoryRoute(categoryModel: categoryModel));
    if(newCategoryList!=null){
      categoryListBloc.onUpdateData(newCategoryList);
    }
  }

  Future<void> deleteCategory(BuildContext context, {required String id})async{
    isLoading.onUpdateData(true);
    final result = await repository.categoryRepo.deleteCategory(id: id);
    if(result.status==1){
      await repository.categoryRepo.getAllCategories().then((newCategory){
        categoryListBloc.onUpdateData(newCategory);
        VxToast.show(context, msg: result.message??'');
        Navigator.pop(context);
      });
    }
    isLoading.onUpdateData(false);
  }
}