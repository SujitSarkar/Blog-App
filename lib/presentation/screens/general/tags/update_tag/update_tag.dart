part of 'update_tag_imports.dart';

@RoutePage<List<TagsModel>>()
class UpdateTag extends StatefulWidget {
  const UpdateTag({super.key, required this.tagModel});
  final TagsModel tagModel;

  @override
  State<UpdateTag> createState() => _UpdateTagState();
}

class _UpdateTagState extends State<UpdateTag> {
  late UpdateTagViewModel updateTagViewModel;

  @override
  void initState() {
    updateTagViewModel = UpdateTagViewModel(repository: context.read<Repository>());
    updateTagViewModel.updateTitleListener(widget.tagModel.title??'');
    super.initState();
  }
  @override
  void dispose() {
    updateTagViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Update Tags'.text.size(18.sp).fontWeight(FontWeight.w600).make(),
        centerTitle: true,
      ),
      body: Form(
        key: updateTagViewModel.updateTagGlobalKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            TextFormFieldWidget(
              controller: updateTagViewModel.titleController,
              labelText: 'Title',
              hintText: 'Title',
              required: true,
              textInputType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
            ),
            20.h.heightBox,
            TextFormFieldWidget(
              controller: updateTagViewModel.slugController,
              labelText: 'Slug',
              hintText: 'Slug',
              required: true,
              textInputType: TextInputType.text,
            ),
            30.h.heightBox,
            BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
              bloc: updateTagViewModel.isLoading,
              builder: (context, state) {
                return SolidButton(
                  onTap: () {
                    updateTagViewModel.updateTag(context,tagId: widget.tagModel.id.toString());
                  },
                  isLoading: state.data,
                  child: "Update Tag"
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
