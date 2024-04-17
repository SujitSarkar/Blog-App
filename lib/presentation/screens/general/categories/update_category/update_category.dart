part of 'update_category_imports.dart';

@RoutePage<List<CategoryModel>>()
class UpdateCategory extends StatefulWidget {
  const UpdateCategory({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  State<UpdateCategory> createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends State<UpdateCategory> {
  late UpdateCategoryViewModel updateCategoryViewModel;

  @override
  void initState() {
    updateCategoryViewModel = UpdateCategoryViewModel(repository: context.read<Repository>());
    updateCategoryViewModel.updateTitleListener(widget.categoryModel.title??'');
    super.initState();
  }
  @override
  void dispose() {
    updateCategoryViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Update Category'.text.size(18.sp).fontWeight(FontWeight.w600).make(),
        centerTitle: true,
      ),
      body: Form(
        key: updateCategoryViewModel.updateCategoryGlobalKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            TextFormFieldWidget(
              controller: updateCategoryViewModel.titleController,
              labelText: 'Title',
              hintText: 'Title',
              required: true,
              textInputType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
            ),
            20.h.heightBox,
            TextFormFieldWidget(
              controller: updateCategoryViewModel.slugController,
              labelText: 'Slug',
              hintText: 'Slug',
              required: true,
              textInputType: TextInputType.text,
            ),
            30.h.heightBox,
            BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
              bloc: updateCategoryViewModel.isLoading,
              builder: (context, state) {
                return SolidButton(
                  onTap: () {
                    updateCategoryViewModel.updateCategory(context,id: widget.categoryModel.id.toString());
                  },
                  isLoading: state.data,
                  child: "Update Category"
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
