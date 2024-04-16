part of 'home_imports.dart';

@RoutePage()
class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key, required this.homeModel});
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            homeModel.title!
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
            child: CachedNetworkImage(
              imageUrl: homeModel.featuredimage!,
              errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.grey),
              placeholder: (context, url) => const LoadingWidget(),
              height: 200.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          12.h.heightBox,
          homeModel.title!
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
              '${homeModel.views??0} views'.text.size(12.sp).fontWeight(FontWeight.w400).make(),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.thumbsUp,
                  size: 20,
                  color: Colors.green,
                ),
              ),
              '${homeModel.like??0}'.text.size(12.sp).fontWeight(FontWeight.w400).make(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.thumbsDown,
                  size: 20,
                  color: Colors.red,
                ),
              ),
              '${homeModel.dislike??0}'.text.size(12.sp).fontWeight(FontWeight.w400).make(),
            ],
          ),
          HtmlWidget(homeModel.body!, renderMode: RenderMode.column),
        ],
      ),
    );
  }
}
