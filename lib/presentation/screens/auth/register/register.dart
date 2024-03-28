part of 'register_imports.dart';

@RoutePage()
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  64.h.heightBox,
                  "Sign Up"
                      .text
                      .size(18.sp)
                      .color(AppColors.primaryColor)
                      .fontWeight(FontWeight.w700)
                      .make(),
                  48.h.heightBox,
                  TextFormFieldWidget(
                    controller: TextEditingController(),
                    labelText: 'Email',
                    hintText: 'Email',
                    prefixIcon: Icons.email_outlined,
                  ),
                  20.h.heightBox,

                  TextFormFieldWidget(
                    controller: TextEditingController(),
                    labelText: 'Password',
                    hintText: 'Password',
                    prefixIcon: Icons.lock_outline,
                    obscure: true,
                  ),
                  20.h.heightBox,

                  TextFormFieldWidget(
                    controller: TextEditingController(),
                    labelText: 'Confirm Password',
                    hintText: 'Confirm Password',
                    prefixIcon: Icons.lock_outline,
                    obscure: true,
                  ),
                  12.h.heightBox,

                  CheckboxListTile(
                    side: const BorderSide(
                        color: AppColors.primaryColor),
                    value: false,
                    onChanged: (newValue){},
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
                  20.h.heightBox,

                  SolidButton(onTap: (){}, child:  "Sign Up"
                      .text
                      .size(16.sp)
                      .color(Colors.white)
                      .fontWeight(FontWeight.w600)
                      .make(),),
                  40.h.heightBox,

                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor),
                      children: [
                        const TextSpan(text: 'Already have an account? '),
                        TextSpan(
                          text: 'Login',
                          style: const TextStyle(color: AppColors.primaryColor,fontWeight: FontWeight.w700),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            AutoRouter.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
