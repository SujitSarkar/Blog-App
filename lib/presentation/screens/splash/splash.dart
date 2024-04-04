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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light));

    moveToOnboard();
    super.initState();
  }

  Future<void> moveToOnboard() async {
    await Future.delayed(const Duration(seconds: 2))
        .then((value) => Utils.manipulateLogin(context));
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
