part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
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
            height: 40.h,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              children: ['Nature', 'Tech', 'DIY', 'Health']
                  .map(
                    (item) => InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.all(Radius.circular(50.r)),
                      child: Container(
                        margin: EdgeInsets.only(right: 8.w),
                        alignment: Alignment.center,
                        width: 100.w,
                        padding: EdgeInsets.symmetric(horizontal: 12.sp),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.primaryColor, width: 1.sp),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.r))),
                        child: item.text
                            .size(12.sp)
                            .fontWeight(FontWeight.w600)
                            .make(),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    ));
  }
}
