part of 'widget_imports.dart';

class HomeGridTile extends StatelessWidget {
  final HomeModel homeModel;

  const HomeGridTile({super.key, required this.homeModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AutoRouter.of(context).push(const HomeDetailsRoute()),
      child: Container(
        width: double.infinity,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(7.r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(7.r)),
              child: Image.asset(
                Assets.assetsImagesNetflix,
                height: 118.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            8.h.heightBox,
            homeModel.title!
                .text
                .size(12.sp).align(TextAlign.start)
                .maxLines(3)
                .fontWeight(FontWeight.w600)
                .make(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateFormat("dd MMM yy").format(homeModel.createdAt!).text
                    .size(6.sp)
                    .maxLines(1)
                    .color(const Color(0xff808080))
                    .fontWeight(FontWeight.w600)
                    .make(),
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor.withOpacity(0.3),
                  radius: 3,
                ),
                '4 min read'
                    .text
                    .size(6.sp)
                    .maxLines(1)
                    .color(const Color(0xff808080))
                    .fontWeight(FontWeight.w600)
                    .make(),
              ],
            ),
            8.h.heightBox,
          ],
        ),
      ),
    );
  }
}
