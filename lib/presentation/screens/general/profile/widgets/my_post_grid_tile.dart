part of 'widget_imports.dart';

class MyPostGridTile extends StatelessWidget {
  final int index;

  const MyPostGridTile({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AutoRouter.of(context).push(const HomeDetailsRoute()),
      child: Container(
        width: double.infinity,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(7.r))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child:
                      'Space Falcon Announces Strategic Partnership with AV Star Capital.'
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
