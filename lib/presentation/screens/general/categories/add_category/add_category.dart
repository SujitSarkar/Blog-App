part of 'add_category_imports.dart';

@RoutePage<List<CategoryModel>>()
class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  late AddCategoryViewModel addCategoryViewModel;

  @override
  void initState() {
    addCategoryViewModel = AddCategoryViewModel(repository: context.read<Repository>());
    addCategoryViewModel.addTitleListener();
    super.initState();
  }
  @override
  void dispose() {
    addCategoryViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Add Category'.text.size(18.sp).fontWeight(FontWeight.w600).make(),
        centerTitle: true,
      ),
      body: Form(
        key: addCategoryViewModel.addCategoryGlobalKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            TextFormFieldWidget(
              controller: addCategoryViewModel.titleController,
              labelText: 'Title',
              hintText: 'Title',
              required: true,
              textInputType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
            ),
            20.h.heightBox,
            TextFormFieldWidget(
              controller: addCategoryViewModel.slugController,
              labelText: 'Slug',
              hintText: 'Slug',
              required: true,
              textInputType: TextInputType.text,
            ),
            30.h.heightBox,
            BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
              bloc: addCategoryViewModel.isLoading,
              builder: (context, state) {
                return SolidButton(
                  onTap: () {
                    addCategoryViewModel.addNewCategory(context);
                  },
                  isLoading: state.data,
                  child: "Add Category"
                      .text
                      .size(16.sp)
                      .color(Colors.white)
                      .fontWeight(FontWeight.w600)
                      .make(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
