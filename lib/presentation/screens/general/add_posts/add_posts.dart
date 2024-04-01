part of 'add_posts_imports.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  QuillController quillController = QuillController.basic();

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
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                child: Image.asset(
                  Assets.assetsImagesPlaceholder,
                  height: 240,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FeatherIcons.camera,
                      color: AppColors.primaryColor,
                    ),
                  ))
            ],
          ),
          12.h.heightBox,
          TextFormFieldWidget(
            controller: TextEditingController(),
            hintText: 'Title',
            labelText: 'Title',
            textCapitalization: TextCapitalization.sentences,
          ),
          12.h.heightBox,
          TextFormFieldWidget(
            controller: TextEditingController(),
            hintText: 'Slug',
            labelText: 'Slug',
            textCapitalization: TextCapitalization.sentences,
          ),
          16.h.heightBox,
          CustomCard(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                'Tags'.text.size(16.sp).fontWeight(FontWeight.w500).make(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18.sp,
                  color: AppColors.secondaryColor,
                )
              ],
            ),
          ),
          16.h.heightBox,
          CustomCard(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                'Categories'
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
          ),
          16.h.heightBox,
          QuillToolbar.simple(
            configurations: QuillSimpleToolbarConfigurations(
              controller: quillController,
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
                controller: quillController,
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
