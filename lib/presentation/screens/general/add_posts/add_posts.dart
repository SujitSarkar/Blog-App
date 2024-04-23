part of 'add_posts_imports.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  late AddPostsViewModel addPostsViewModel;

  @override
  void initState() {
    addPostsViewModel =
        AddPostsViewModel(repository: context.read<Repository>());
    addPostsViewModel.addTitleListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: 'Add Post'.text.size(18.sp).fontWeight(FontWeight.w600).make(),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FeatherIcons.check,
                size: 24,
              ))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          BlocBuilder<VelocityBloc<XFile?>, VelocityState<XFile?>>(
            bloc: addPostsViewModel.selectedImage,
            builder: (context, state) {
              return Stack(
                children: [
                  state.data != null
                      ? Image.file(
                          File(state.data!.path),
                          height: 240,
                          width: 1.sw,
                          fit: BoxFit.cover,
                        ).cornerRadius(10.r)
                      : Image.asset(
                          Assets.assetsImagesPlaceholder,
                          height: 240,
                          width: 1.sw,
                          fit: BoxFit.cover,
                        ).cornerRadius(10.r),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          addPostsViewModel.pickImage(context);
                        },
                        icon: const Icon(
                          FeatherIcons.camera,
                          color: Colors.blue,
                        ),
                      ))
                ],
              );
            },
          ),
          12.h.heightBox,
          TextFormFieldWidget(
            controller: addPostsViewModel.titleController,
            hintText: 'Title',
            labelText: 'Title',
            textCapitalization: TextCapitalization.sentences,
          ),
          12.h.heightBox,
          TextFormFieldWidget(
            controller: addPostsViewModel.slugController,
            hintText: 'Slug',
            labelText: 'Slug',
            textCapitalization: TextCapitalization.sentences,
          ),
          16.h.heightBox,
          BlocBuilder<VelocityBloc<TagsModel?>, VelocityState<TagsModel?>>(
            bloc: addPostsViewModel.selectedTagBloc,
            builder: (context, state) {
              return CustomCard(
                onTap: () async {
                  final TagsModel? tagModel = await AutoRouter.of(context)
                      .push<TagsModel>(const TagsRoute());
                  addPostsViewModel.updateSelectedTag(tagModel);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    state.data != null
                        ? state.data!.title!.text
                            .size(16.sp)
                            .fontWeight(FontWeight.w500)
                            .make()
                        : 'Tags'
                            .text
                            .size(16.sp)
                            .fontWeight(FontWeight.w500)
                            .make(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: AppColors.secondaryColor,
                    )
                  ],
                ),
              );
            },
          ),
          16.h.heightBox,
          BlocBuilder<VelocityBloc<CategoryModel?>, VelocityState<CategoryModel?>>(
            bloc: addPostsViewModel.selectedCategoryBloc,
            builder: (context, state) {
              return CustomCard(
                onTap: () async {
                  final CategoryModel? categoryModel =
                      await AutoRouter.of(context)
                          .push<CategoryModel>(const CategoriesRoute());
                  addPostsViewModel.updateSelectedCategory(categoryModel);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    state.data !=null? state.data!.title!
                        .text
                        .size(16.sp)
                        .fontWeight(FontWeight.w500)
                        .make()
                        : 'Categories'
                        .text
                        .size(16.sp)
                        .fontWeight(FontWeight.w500)
                        .make(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.sp,
                      color: AppColors.secondaryColor,
                    )
                  ],
                ),
              );
            },
          ),
          16.h.heightBox,
          QuillToolbar.simple(
            configurations: QuillSimpleToolbarConfigurations(
              controller: addPostsViewModel.quillController,
              sharedConfigurations: const QuillSharedConfigurations(
                locale: Locale('en'),
              ),
            ),
          ),
          SizedBox(
            height: 400.h,
            child: QuillEditor.basic(
              configurations: QuillEditorConfigurations(
                showCursor: true,
                placeholder: 'Write here...',
                controller: addPostsViewModel.quillController,
                readOnly: false,
                sharedConfigurations: const QuillSharedConfigurations(
                  locale: Locale('en'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
