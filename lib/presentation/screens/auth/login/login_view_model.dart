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
    try {
      final LoginModel loginModel = await repository.authRepo
          .userLogin(email: email.text.trim(), password: password.text);
      if (loginModel.accessToken != null) {
        await Utils.saveToken(loginModel.accessToken!.toString()).then(
            (value) => AutoRouter.of(context).replace(const GeneralRoute()));
      }
    } on Exception catch (e) {
      // ignore: use_build_context_synchronously
      VxToast.show(context, msg: e.toString());
    }
  }
}
