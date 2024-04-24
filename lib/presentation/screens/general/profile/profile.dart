part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileViewModel profileViewModel;

  @override
  void initState() {
    profileViewModel = ProfileViewModel(repository: context.read<Repository>());
    profileViewModel.fetchUserProfileData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        actions: [
          BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
            bloc: profileViewModel.isLoadingBloc,
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    debugPrint('Logout');
                    profileViewModel.logout(context);
                  },
                  icon: state.data
                      ? const LoadingWidget(color: Colors.white)
                      : const Icon(
                          FeatherIcons.logOut,
                          color: Colors.white,
                        ));
            },
          )
        ],
      ),
      body:
          BlocBuilder<VelocityBloc<ProfileModel>, VelocityState<ProfileModel>>(
        bloc: profileViewModel.profileModelBloc,
        builder: (context, state) {
          if (state is VelocityInitialState) {
            return const LoadingWidget();
          } else if (state is VelocityUpdateState) {
            return ListRefreshIndicator(
              onRefresh: () async =>
                  await profileViewModel.fetchUserProfileData(context),
              child: ListView(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    height: 440.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.r),
                            bottomRight: Radius.circular(40.r))),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              state.data.userDetails!.profilePhotoUrl!),
                          radius: 64.r,
                        ),
                        12.h.heightBox,
                        '${state.data.userDetails?.name}'
                            .text
                            .size(16.sp)
                            .color(Colors.white)
                            .fontWeight(FontWeight.w600)
                            .make(),
                        '${state.data.userDetails?.email}'
                            .text
                            .size(14.sp)
                            .color(Colors.white70)
                            .align(TextAlign.center)
                            .fontWeight(FontWeight.w400)
                            .make(),
                        12.h.heightBox,
                        '${state.data.userDetails?.about}'
                            .text
                            .maxLines(7)
                            .ellipsis
                            .size(14.sp)
                            .color(Colors.white70)
                            .align(TextAlign.center)
                            .fontWeight(FontWeight.w400)
                            .make(),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                '${state.data.postsCount}'
                                    .text
                                    .size(16.sp)
                                    .color(Colors.white)
                                    .align(TextAlign.center)
                                    .fontWeight(FontWeight.w700)
                                    .make(),
                                'Posts'
                                    .text
                                    .size(16.sp)
                                    .color(Colors.white)
                                    .align(TextAlign.center)
                                    .fontWeight(FontWeight.w500)
                                    .make(),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                '0'
                                    .text
                                    .size(16.sp)
                                    .color(Colors.white)
                                    .align(TextAlign.center)
                                    .fontWeight(FontWeight.w700)
                                    .make(),
                                'Following'
                                    .text
                                    .size(16.sp)
                                    .color(Colors.white)
                                    .align(TextAlign.center)
                                    .fontWeight(FontWeight.w500)
                                    .make(),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                '0'
                                    .text
                                    .size(16.sp)
                                    .color(Colors.white)
                                    .align(TextAlign.center)
                                    .fontWeight(FontWeight.w700)
                                    .make(),
                                'Followers'
                                    .text
                                    .size(16.sp)
                                    .color(Colors.white)
                                    .align(TextAlign.center)
                                    .fontWeight(FontWeight.w500)
                                    .make(),
                              ],
                            ),
                          ],
                        ),
                        20.h.heightBox,
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: 'My Posts'
                        .text
                        .size(18.sp)
                        .fontWeight(FontWeight.w600)
                        .make(),
                  ),
                  GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.85,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 12.h),
                    itemCount: state.data.posts?.length,
                    itemBuilder: (context, index) =>
                        MyPostGridTile(myPost: state.data.posts![index]),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
