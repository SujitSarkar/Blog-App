part of 'home_imports.dart';

class HomeViewModel{
  final Repository repository;
  HomeViewModel({required this.repository});

  VelocityBloc<bool> isLoading = VelocityBloc(false);
  VelocityBloc<List<HomeModel>> postsBloc = VelocityBloc(<HomeModel>[]);

  Future<void> fetchAllPosts() async{
    List<HomeModel> result = await repository.postRepo.getAllPosts();
    if(result.isNotEmpty){
      postsBloc.onUpdateData(result);
    }
  }
}