import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/app_color.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const PasswordField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isHidden = true;
  bool isTyping = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: isHidden,
      onChanged: (val) {
        setState(() {
          isTyping = val.isNotEmpty;
        });
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColor.greyColor, fontSize: 14.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        suffixIcon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isTyping
              ? IconButton(
                  key: const ValueKey("icon"),
                  onPressed: () => setState(() => isHidden = !isHidden),
                  icon: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(isHidden ? 3.14 : 0),
                    child: Icon(
                      isHidden
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColor.greyColor,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColor.greyColor, width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
        ),
      ),
    );
  }
}
