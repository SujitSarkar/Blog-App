part of 'widget_imports.dart';

class MyPostGridTile extends StatelessWidget {
  final MyPost myPost;

  const MyPostGridTile({super.key, required this.myPost});

  @override
  Widget build(BuildContext context) {
    final featuredimage = myPost.featuredimage.toString().prepend(ApiConstant.baseUrl).replaceAll('public','storage');
    return InkWell(
      onTap: (){
        HomeModel homeModel = HomeModel(
          id: myPost.id,
    name: null,
    email: null,
    emailVerifiedAt: null,
    currentTeamId: null,
    profilePhotoPath: '',
    about: '',
    createdAt: myPost.createdAt,
    updatedAt: myPost.updatedAt,
    userId: myPost.userId,
    title: myPost.title,
    slug: myPost.slug,
    featuredimage: featuredimage,
    body: myPost.body,
    status: myPost.status,
    like: myPost.like,
    dislike: myPost.dislike,
    views: myPost.views,
    profilePhotoUrl: null,
        );
        AutoRouter.of(context).push(HomeDetailsRoute(homeModel: homeModel));
      },
      // onTap: () => A
      child: Container(
        width: double.infinity,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(7.r))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: Key(myPost.id.toString()),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(7.r)),
                child: CachedNetworkImage(
                  imageUrl: featuredimage,
                  errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.grey),
                  placeholder: (context, url) => const LoadingWidget(),
                  height: 118.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            8.h.heightBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child:
                      '${myPost.title}'
                          .text
                          .size(12.sp)
                          .maxLines(3)
                          .fontWeight(FontWeight.w600)
                          .make(),
                ),
                const Icon(
                  FeatherIcons.moreVertical,
                  size: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
