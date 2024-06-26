part of 'login_imports.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginViewModel loginViewModel;
  @override
  void initState() {
    loginViewModel = LoginViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: ListView(
          children: [
            Image.asset(
              Assets.assetsImagesLogo,
              height: 42.h,
              width: 139.w,
              fit: BoxFit.fitHeight,
              color: Colors.white,
            ),
            64.h.heightBox,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height - 120.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.r),
                      topRight: Radius.circular(24.r))),
              child: Form(
                key: loginViewModel.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    64.h.heightBox,
                    "Login"
                        .text
                        .size(18.sp)
                        .color(AppColors.primaryColor)
                        .fontWeight(FontWeight.w700)
                        .make(),
                    48.h.heightBox,
                    TextFormFieldWidget(
                      controller: loginViewModel.email,
                      labelText: 'Email',
                      hintText: 'Email',
                      required: true,
                      prefixIcon: Icons.email_outlined,
                      textInputType: TextInputType.emailAddress,
                    ),
                    20.h.heightBox,
                    TextFormFieldWidget(
                      controller: loginViewModel.password,
                      labelText: 'Password',
                      hintText: 'Password',
                      required: true,
                      prefixIcon: Icons.lock_outline,
                      obscure: true,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    12.h.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            side:
                                const BorderSide(color: AppColors.primaryColor),
                            value: false,
                            onChanged: (newValue) {},
                            title: "Remember me"
                                .text
                                .size(12.sp)
                                .color(AppColors.primaryColor)
                                .fontWeight(FontWeight.w600)
                                .make(),
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: InkWell(
                            onTap: () {},
                            child: "Forgot your password"
                                .text
                                .size(12.sp)
                                .color(AppColors.primaryColor)
                                .fontWeight(FontWeight.w600)
                                .make(),
                          ),
                        ),
                      ],
                    ),
                    20.h.heightBox,
                    BlocBuilder<VelocityBloc<bool>, VelocityState<bool>>(
                      bloc: loginViewModel.isLoadingBloc,
                      builder: (context,state) {
                        return SolidButton(
                          onTap: () => loginViewModel.login(context),
                          isLoading: state.data,
                          child: "Login"
                              .text
                              .size(16.sp)
                              .color(Colors.white)
                              .fontWeight(FontWeight.w600)
                              .make(),
                        );
                      }
                    ),
                    40.h.heightBox,
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor),
                        children: [
                          const TextSpan(text: 'Don’t have an account? '),
                          TextSpan(
                            text: 'Sign Up',
                            style: const TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w700),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                AutoRouter.of(context)
                                    .push(const RegisterRoute());
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
