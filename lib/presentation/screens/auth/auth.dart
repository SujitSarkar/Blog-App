part of 'auth_imports.dart';

@RoutePage()
class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.assetsImagesLoginBg),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    Assets.assetsImagesLogo,
                    height: 42.h,
                    width: 139.w,
                  ).centered(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Explore the world,\nBillions of thoughts.'
                          .text
                          .align(TextAlign.left)
                          .size(28.sp)
                          .white
                          .fontWeight(FontWeight.w700)
                          .make(),
                      20.h.heightBox,
                      CustomOutlineButton(
                        borderColor: Colors.white,
                        splashColor: MaterialStateProperty.all(
                            Colors.white.withOpacity(0.3)),
                        onTap: () =>
                            AutoRouter.of(context).push(const LoginRoute()),
                        child: "Login"
                            .text
                            .size(16.sp)
                            .color(Colors.white)
                            .fontWeight(FontWeight.w700)
                            .make(),
                      ),
                      8.h.heightBox,
                      CustomTextButton(
                        onTap: () =>
                            AutoRouter.of(context).push(const RegisterRoute()),
                        splashColor: MaterialStateProperty.all(
                            Colors.white.withOpacity(0.3)),
                        child: "Register"
                            .text
                            .size(16.sp)
                            .color(Colors.white)
                            .fontWeight(FontWeight.w700)
                            .make(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
