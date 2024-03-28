part of 'widget_imports.dart';

class SearchField extends StatelessWidget {
  const SearchField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.onTap,
      this.textInputType,
      this.textCapitalization,
      this.textAlign = TextAlign.left,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixColor,
      this.prefixColor,
      this.suffixOnTap,
      this.prefixOnTap,
      this.onChanged,
      this.onEditingComplete,
      this.contentPadding,
      this.focusNode});

  final TextEditingController controller;
  final String hintText;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? suffixColor;
  final Color? prefixColor;
  final TextAlign? textAlign;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function()? suffixOnTap;
  final Function()? prefixOnTap;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return TextFormField(
      controller: controller,
      onTap: onTap,
      focusNode: focusNode,
      onChanged: (val) {
        if (onChanged != null) {
          onChanged!(val);
        }
      },
      onEditingComplete: onEditingComplete,
      keyboardType: textInputType ?? TextInputType.text,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      textAlign: textAlign!,
      style: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp),
      decoration: InputDecoration(
          alignLabelWithHint: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide: BorderSide(
                color: AppColors.secondaryColor,
                width: 1.sp,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide:
                  BorderSide(color: AppColors.secondaryColor, width: 1.sp)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide:
                  BorderSide(color: AppColors.secondaryColor, width: 1.sp)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              borderSide:
                  BorderSide(color: AppColors.secondaryColor, width: 1.sp)),
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintStyle: TextStyle(
              color: const Color(0xffB5B5B5),
              fontWeight: FontWeight.w400,
              fontSize: 16.sp),
          prefixIcon: prefixIcon != null
              ? InkWell(
                  onTap: prefixOnTap,
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.w, left: 10.w),
                    child: Icon(prefixIcon,
                        size: 20.sp,
                        color: prefixColor ?? AppColors.primaryColor),
                  ),
                )
              : null,
          suffixIconConstraints: BoxConstraints.loose(size),
          prefixIconConstraints: BoxConstraints.loose(size),
          suffixIcon: InkWell(
            onTap: suffixOnTap,
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Icon(suffixIcon, size: 28.sp),
            ),
          )),
    );
  }
}
