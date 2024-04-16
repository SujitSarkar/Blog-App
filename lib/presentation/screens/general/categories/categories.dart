part of 'categories_imports.dart';

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
    categoriesViewModel.fetchAllTags();
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
                onPressed: () {},
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
              return ListView.separated(
              padding: EdgeInsets.only(left: 16.w, right: 4.w, top: 12.h),
              separatorBuilder: (context, index) => 16.h.heightBox,
              itemCount: state.data.length,
              itemBuilder: (context, index) => ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                onTap: () {},
                leading: '${index + 1}'.text.size(14.sp).make(),
                title: '${state.data[index].title}'.text.size(14.sp).make(),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FeatherIcons.edit2,
                            size: 20,
                            color: Colors.green,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FeatherIcons.trash,
                            size: 20,
                            color: Colors.red,
                          ))
                    ],
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
}
