part of 'widgets_imports.dart';

class OnBoardFirst extends StatelessWidget {
  const OnBoardFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/onboard_1.png',
          height: 333.h,
          width: 333.w,
          fit: BoxFit.cover,
        ),
        "Discover, engage and read the latest articles oras well as share your own thoughts and ideas with the community"
            .text.align(TextAlign.center)
            .size(15.sp)
            .color(Colors.black)
            .fontWeight(FontWeight.w500)
            .make(),
      ],
    );
  }
}
