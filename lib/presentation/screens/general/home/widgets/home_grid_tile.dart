part of 'widget_imports.dart';

class HomeGridTile extends StatelessWidget {
  final int index;

  const HomeGridTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AutoRouter.of(context).push(const HomeDetailsRoute()),
      child: Container(
        width: double.infinity,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(7.r))),
        child: Column(
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
            'Space Falcon Announces Strategic Partnership with AV Star Capital.'
                .text
                .size(12.sp)
                .maxLines(3)
                .fontWeight(FontWeight.w600)
                .make(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                '23 May 2023'
                    .text
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
