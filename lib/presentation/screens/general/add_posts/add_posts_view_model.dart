part of 'add_posts_imports.dart';

class AddPostsViewModel {
  final Repository repository;
  AddPostsViewModel({required this.repository});

  final QuillController quillController = QuillController.basic();
  final ImagePicker picker = ImagePicker();
  final VelocityBloc<XFile?> selectedImage = VelocityBloc(null);
  final VelocityBloc<bool> inLoading = VelocityBloc(false);
  final TextEditingController titleController = TextEditingController();
  final TextEditingController slugController = TextEditingController();

  void addTitleListener() {
    titleController.addListener(() {
      slugController.text =
          titleController.text.toLowerCase().replaceAll(" ", "-").trim();
    });
  }
  void dispose(){
    titleController.dispose();
  }


  Future<void> pickImage(BuildContext context) async {
    await picker.pickImage(source: ImageSource.gallery).then((image) {
      if (image != null) {
        selectedImage.onUpdateData(image);
      } else {
        VxToast.show(context, msg: 'No image selected');
      }
    });
  }
}
