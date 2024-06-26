part of 'profile_imports.dart';

class ProfileViewModel {
  final Repository repository;
  ProfileViewModel({required this.repository});

  final VelocityBloc<bool> isLoadingBloc = VelocityBloc<bool>(false);
  final VelocityBloc<ProfileModel> profileModelBloc =
      VelocityBloc(ProfileModel());

  Future<void> fetchUserProfileData(BuildContext context) async {
    final result = await repository.postRepo.getUserPorofile();
    if (result.status != null && result.status == 1) {
      profileModelBloc.onUpdateData(result);
      if (context.mounted) {
        context.read<VelocityBloc<ProfileModel>>().onUpdateData(result);
      }
    }
  }

  Future<void> logout(BuildContext context) async {
    isLoadingBloc.onUpdateData(true);
    final MessageModel messageModel = await repository.authRepo.userLogout();
    if (messageModel.message.isNotEmptyAndNotNull) {
      Utils.clearAllSavedData();
      // ignore: use_build_context_synchronously
      AutoRouter.of(context).push(const AuthRoute());
    }
    isLoadingBloc.onUpdateData(false);
  }
}
