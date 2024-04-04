part of 'profile_imports.dart';

class ProfileViewModel {
  final Repository repository;

  ProfileViewModel({required this.repository});

  Future<void> logout(BuildContext context) async {
    final MessageModel messageModel = await repository.authRepo.userLogout();
    if (messageModel.message.isNotEmptyAndNotNull) {
      Utils.clearAllSavedData();
      // ignore: use_build_context_synchronously
      AutoRouter.of(context).push(const AuthRoute());
    }
  }
}
