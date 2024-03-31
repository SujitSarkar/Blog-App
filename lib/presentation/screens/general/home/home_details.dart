part of 'home_imports.dart';

@RoutePage()
class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            'Space Falcon Announces Strategic Partnership with AV Star Capital'
                .text
                .ellipsis
                .make(),
        titleSpacing: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(7.r)),
            child: Image.asset(
              Assets.assetsImagesNetflix,
              height: 200.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          12.h.heightBox,
          'Space Falcon Announces Strategic Partnership with AV Star Capital'
              .text
              .size(16.sp)
              .fontWeight(FontWeight.w600)
              .make(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                FeatherIcons.eye,
                size: 20,
              ),
              8.h.widthBox,
              '47 views'.text.size(12.sp).fontWeight(FontWeight.w400).make(),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.thumbsUp,
                  size: 20,
                  color: Colors.green,
                ),
              ),
              '0'.text.size(12.sp).fontWeight(FontWeight.w400).make(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.thumbsDown,
                  size: 20,
                  color: Colors.red,
                ),
              ),
              '0'.text.size(12.sp).fontWeight(FontWeight.w400).make(),
            ],
          ),
          12.h.heightBox,
          'Space Falcon is thrilled to officially announce a strategic partnership with AV Star Capital, a leading Asian crypto incubator. This partnership will help us achieve greater results in the field of the metaverse and also in the NFT market.NFTs are the future of the art and gaming industries. There is a lot of potential as the interest in NFTs grows exponentially every day. Through this partnership with AV Star Capital, Spacefalcon.io plans to take virtual assets a step further with the introduction of planets, spaceships, and galaxies. This gives every NFTs game player an opportunity to own and control what they buy, earn, or craft.'
              .text
              .size(16.sp)
              .fontWeight(FontWeight.w400)
              .make(),
        ],
      ),
    );
  }
}
