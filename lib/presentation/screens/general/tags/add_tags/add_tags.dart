part of 'add_tags_imports.dart';

@RoutePage<List<TagsModel>>()
class AddTags extends StatefulWidget {
  const AddTags({super.key});

  @override
  State<AddTags> createState() => _AddTagsState();
}

class _AddTagsState extends State<AddTags> {
  late AddTagsViewModel addTagsViewModel;

  @override
  void initState() {
    addTagsViewModel = AddTagsViewModel(repository: context.read<Repository>());
    addTagsViewModel.addTitleListener();
    super.initState();
  }
  @override
  void dispose() {
    addTagsViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Add Tags'.text.size(18.sp).fontWeight(FontWeight.w600).make(),
        centerTitle: true,
      ),
      body: Form(
        key: addTagsViewModel.addTagGlobalKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            TextFormFieldWidget(
              controller: addTagsViewModel.titleController,
              labelText: 'Title',
              hintText: 'Title',
              required: true,
              textInputType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
            ),
            20.h.heightBox,
            TextFormFieldWidget(
              controller: addTagsViewModel.slugController,
              labelText: 'Slug',
              hintText: 'Slug',
              required: true,
              textInputType: TextInputType.text,
            ),
            30.h.heightBox,
            BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
              bloc: addTagsViewModel.isLoading,
              builder: (context, state) {
                return SolidButton(
                  onTap: () {
                    addTagsViewModel.addNewTags(context);
                  },
                  isLoading: state.data,
                  child: "Add Tag"
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
