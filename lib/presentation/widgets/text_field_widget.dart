part of 'widgets_imports.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.hintText,
      this.onTap,
      this.obscure = false,
      this.readOnly = false,
      this.required = false,
      this.textInputType,
      this.textCapitalization,
      this.textAlign = TextAlign.left,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixColor,
      this.prefixColor,
      this.maxLine,
      this.minLine,
      this.validationErrorMessage,
      this.maxLength,
      this.suffixOnTap,
      this.prefixOnTap,
      this.onChanged,
      this.onEditingComplete,
      this.contentPadding,
      this.focusNode});

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextInputType? textInputType;
  final TextCapitalization? textCapitalization;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? suffixColor;
  final Color? prefixColor;
  final TextAlign? textAlign;
  final bool obscure;
  final bool required;
  final bool readOnly;
  final int? maxLine;
  final int? minLine;
  final int? maxLength;
  final String? validationErrorMessage;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function()? suffixOnTap;
  final Function()? prefixOnTap;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        widget.labelText.text
            .size(15.sp)
            .fontWeight(FontWeight.w500)
            .color(AppColors.primaryColor)
            .make(),
        12.h.heightBox,
        TextFormField(
          validator: (value) {
            if (widget.required && value != null && value.isEmpty) {
              return "${widget.labelText} can't be empty";
            } else if (widget.required &&
                value != null &&
                widget.textInputType == TextInputType.emailAddress &&
                !value.isValidEmail) {
              return "Invalid email address";
            }
            // else if (widget.required &&
            //     value != null &&
            //     widget.textInputType == TextInputType.visiblePassword &&
            //     !value.isValidEmail) {
            //   VxToast.show(context,
            //       msg:
            //           "Password must contain one upper and lower case combination, at least one number and special charecter",
            //       position: VxToastPosition.top,
            //       showTime: 5000);
            //   return "Password must contain one upper and lower case combination, at least one number and special charecter";
            // }
            else {
              return null;
            }
          },
          controller: widget.controller,
          onTap: widget.onTap,
          focusNode: widget.focusNode,
          onChanged: (val) {
            if (widget.onChanged != null) {
              widget.onChanged!(val);
            }
          },
          maxLength: widget.maxLength,
          onEditingComplete: widget.onEditingComplete,
          readOnly: widget.readOnly,
          obscureText: widget.obscure ? _obscure : false,
          keyboardType: widget.textInputType ?? TextInputType.text,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          maxLines: widget.maxLine ?? 1,
          minLines: widget.minLine ?? 1,
          textAlign: widget.textAlign!,
          style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp),
          decoration: InputDecoration(
              errorText: widget.validationErrorMessage,
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 1.sp,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  borderSide:
                      BorderSide(color: AppColors.primaryColor, width: 1.sp)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  borderSide:
                      BorderSide(color: AppColors.primaryColor, width: 1.sp)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  borderSide:
                      BorderSide(color: AppColors.errorColor, width: 1.sp)),
              isDense: true,
              contentPadding: widget.contentPadding ??
                  EdgeInsets.symmetric(horizontal: 12.sp, vertical: 16.sp),
              floatingLabelAlignment: FloatingLabelAlignment.start,
              hintText: widget.hintText,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              hintStyle: TextStyle(
                  color: const Color(0xffB5B5B5),
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp),
              prefixIcon: widget.prefixIcon != null
                  ? InkWell(
                      onTap: widget.prefixOnTap,
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.w, left: 10.w),
                        child: Icon(widget.prefixIcon,
                            size: 20.sp,
                            color:
                                widget.prefixColor ?? AppColors.primaryColor),
                      ),
                    )
                  : null,
              suffixIconConstraints: BoxConstraints.loose(size),
              prefixIconConstraints: BoxConstraints.loose(size),
              suffixIcon: widget.obscure
                  ? InkWell(
                      onTap: () => setState(() => _obscure = !_obscure),
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Icon(
                            _obscure
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye,
                            size: 20.sp,
                            color:
                                widget.suffixColor ?? AppColors.primaryColor),
                      ),
                    )
                  : InkWell(
                      onTap: widget.suffixOnTap,
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Icon(widget.suffixIcon, size: 28.sp),
                      ),
                    )),
        ),
      ],
    );
  }
}
