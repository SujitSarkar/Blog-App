part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));

    homeViewModel = HomeViewModel(repository: context.read<Repository>());
    homeViewModel.fetchAllPosts();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Assets.assetsImagesLogo,
                      height: 24.h,
                      width: 80.w,
                      color: AppColors.primaryColor,
                      fit: BoxFit.fitHeight,
                    ),
                    Image.asset(
                      Assets.assetsImagesUser,
                      height: 36.h,
                      width: 36.w,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: SearchField(
                  controller: TextEditingController(),
                  hintText: 'Search',
                  prefixIcon: FeatherIcons.search,
                  prefixColor: AppColors.secondaryColor,
                ),
              ),
              12.h.heightBox,
              SizedBox(
                height: 32.h,
                child: TabBar(
                  controller: tabController,
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: AppColors.primaryColor,
                  dividerColor: Colors.transparent,
                  indicatorColor: AppColors.primaryColor,
                  isScrollable: true,
                  onTap: (value) {
                    debugPrint(value.toString());
                  },
                  tabs: ['Nature', 'Tech', 'DIY', 'Health']
                      .map(
                        (item) =>
                        Tab(
                          text: item,
                        ),
                  )
                      .toList(),
                ),
              ),
              Expanded(
                  child: BlocBuilder<VelocityBloc<List<HomeModel>>, VelocityState<List<HomeModel>>>(
                    bloc: homeViewModel.postsBloc,
                    builder: (context, state) {
                      if(state is VelocityInitialState){
                        return const LoadingWidget();
                      }else if(state is VelocityUpdateState){
                        return ListRefreshIndicator(
                          onRefresh: () async => await homeViewModel.fetchAllPosts(),
                          child: GridView.builder(
                            padding: EdgeInsets.all(16.w),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.8,
                                crossAxisSpacing: 16.w,
                                mainAxisSpacing: 12.h),
                            itemCount: state.data.length,
                            itemBuilder: (context, index) =>
                                HomeGridTile(homeModel: state.data[index]),
                          ),
                        );
                      }else{
                        return const SizedBox.shrink();
                      }
                    },
                  ))
            ],
          ),
        ));
  }
}
