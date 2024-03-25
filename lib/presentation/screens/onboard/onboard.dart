part of 'onboard_imports.dart';

@RoutePage()
class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  OnboardViewModel onboardViewModel = OnboardViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              24.h.heightBox,
              Image.asset(
                Assets.assetsImagesLogo,
                height: 42.h,
                width: 139.w,
                fit: BoxFit.fitWidth,
                color: AppColors.primaryColor,
              ),
              24.h.heightBox,

              PageView(
                controller: onboardViewModel.onboardPageController,
                children: const [
                  OnBoardFirst(),
                  OnBoardSecond(),
                  OnBoardThird(),
                ],
              ).expand(),
              61.h.heightBox,

              ///Bottom Section
              SolidButton(
                onTap: () => AutoRouter.of(context).push(const AuthRoute()),
                child: "Get Started"
                    .text
                    .size(16.sp)
                    .color(Colors.white)
                    .fontWeight(FontWeight.w700)
                    .make(),
              ),
              61.h.heightBox,

              ///Skip & next button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  "Skip"
                      .text
                      .size(16.sp)
                      .color(AppColors.primaryColor)
                      .fontWeight(FontWeight.w700)
                      .make(),
                  SmoothPageIndicator(
                      controller: onboardViewModel.onboardPageController,
                      count: 3,
                      effect: const WormEffect(
                          dotWidth: 8.0,
                          dotHeight: 8.0,
                          activeDotColor: AppColors.primaryColor),
                      onDotClicked: (index) {}),
                  "Next"
                      .text
                      .size(16.sp)
                      .color(AppColors.primaryColor)
                      .fontWeight(FontWeight.w700)
                      .make(),
                ],
              ),
              12.h.heightBox,
            ],
          ),
        ),
      )),
    );
  }
}
