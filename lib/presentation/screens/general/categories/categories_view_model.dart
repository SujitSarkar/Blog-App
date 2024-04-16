part of 'categories_imports.dart';

class CategoriesViewModel{
  final Repository repository;

  CategoriesViewModel({required this.repository});

  VelocityBloc<List<CategoryModel>> categoryListBloc = VelocityBloc([]);

  Future<void> fetchAllTags() async {
    List<CategoryModel> result = await repository.categoryRepo.getAllCategories();
    if (result.isNotEmpty) {
      categoryListBloc.onUpdateData(result);
    }
  }
}