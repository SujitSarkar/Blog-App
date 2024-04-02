part of 'login_imports.dart';

class LoginViewModel {
  final Repository repository;

  LoginViewModel({required this.repository});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey();

  Future<void> login(BuildContext context) async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }
    if (!email.text.isValidEmail) {
      VxToast.show(context, msg: 'Invalid Email');
      return;
    }

    if (!password.text.isValidPassword) {
      VxToast.show(context, msg: 'Invalid Password');
      return;
    }
    try {
      await repository.authRepo
          .userLogin(email: email.text, password: password.text);
    } on Exception catch (e) {
      // ignore: use_build_context_synchronously
      VxToast.show(context, msg: e.toString());
    }
  }
}
