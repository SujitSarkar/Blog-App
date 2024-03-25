part of 'splash_imports.dart';

@RoutePage()
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    moveToOnboard();
    super.initState();
  }

  Future<void> moveToOnboard() async {
    await Future.delayed(const Duration(seconds: 3))
        .then((value) => AutoRouter.of(context).push(const OnBoardRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: FadedScaleAnimation(
            child: Image.asset(Assets.assetsImagesLogo,
                height: 42.h, width: 139.w, fit: BoxFit.fitWidth)),
      ),
    );
  }
}
