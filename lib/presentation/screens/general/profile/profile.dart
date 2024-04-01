part of 'profile_imports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FeatherIcons.logOut,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
                  backgroundImage:
                      const AssetImage(Assets.assetsImagesKualalampur),
                  radius: 64.r,
                ),
                12.h.heightBox,
                'Sangam'
                    .text
                    .size(16.sp)
                    .color(Colors.white)
                    .fontWeight(FontWeight.w600)
                    .make(),
                'sangam@gmail.com'
                    .text
                    .size(14.sp)
                    .color(Colors.white70)
                    .align(TextAlign.center)
                    .fontWeight(FontWeight.w400)
                    .make(),
                12.h.heightBox,
                'Space Falcon is thrilled to officially announce a strategic partnership with AV Star Capital, a leading Asian crypto incubator. This partnership will help us achieve greater results in the field of the metaverse and also in the NFT market.'
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
                        '6'
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
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child:
                'My Posts'.text.size(18.sp).fontWeight(FontWeight.w600).make(),
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
            itemCount: 10,
            itemBuilder: (context, index) => MyPostGridTile(index: index),
          )
        ],
      ),
    );
  }
}
