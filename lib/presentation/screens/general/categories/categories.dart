part of 'categories_imports.dart';

@RoutePage()
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late CategoriesViewModel categoriesViewModel;

  @override
  void initState() {
    categoriesViewModel =
        CategoriesViewModel(repository: context.read<Repository>());
    categoriesViewModel.fetchAllCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title:
              'Categories'.text.size(18.sp).fontWeight(FontWeight.w600).make(),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  categoriesViewModel.goToAddCategoryPage(context);
                },
                icon: const Icon(
                  FeatherIcons.plus,
                  size: 24,
                ))
          ],
        ),
        body: BlocBuilder<VelocityBloc<List<CategoryModel>>, VelocityState<List<CategoryModel>>>(
          bloc: categoriesViewModel.categoryListBloc,
          builder: (context, state) {
            if(state is VelocityInitialState){
              return const LoadingWidget();
            }else if(state is VelocityUpdateState){
              return ListRefreshIndicator(
                onRefresh: () async {
                  await categoriesViewModel.fetchAllCategory();
                },
                child: ListView.separated(
                padding: EdgeInsets.only(left: 16.w, right: 4.w, top: 12.h),
                physics: const AlwaysScrollableScrollPhysics(),
                separatorBuilder: (context, index) => 16.h.heightBox,
                itemCount: state.data.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  leading: '${index + 1}'.text.size(14.sp).make(),
                  title: '${state.data[index].title}'.text.size(14.sp).make(),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              categoriesViewModel.goToUpdateCategoryPage(context, categoryModel: state.data[index]);
                            },
                            icon: const Icon(
                              FeatherIcons.edit2,
                              size: 20,
                              color: Colors.green,
                            )),
                        IconButton(
                            onPressed: () {
                              deleteCategoryAlert(
                                  id: state.data[index].id.toString());
                            },
                            icon: const Icon(
                              FeatherIcons.trash,
                              size: 20,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ),
                ),
                            ),
              );
            }else{
              return const SizedBox.shrink();
            }
          },
        ));
  }
  void deleteCategoryAlert({required String id}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Delete this category?"),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('NO',
                    style: TextStyle(color: Colors.green))),
            BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
              bloc: categoriesViewModel.isLoading,
              builder: (context, state) {
                return TextButton(
                    onPressed: () {
                      categoriesViewModel.deleteCategory(context, id: id);
                    },
                    child: state.data
                        ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator())
                        : const Text(
                      'YES',
                      style: TextStyle(color: Colors.red),
                    ));
              },
            )
          ],
        ));
  }
}
