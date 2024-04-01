part of 'widget_imports.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.child, this.onTap});
  final Widget child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      child: Ink(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: child,
      ),
    );
  }
}
