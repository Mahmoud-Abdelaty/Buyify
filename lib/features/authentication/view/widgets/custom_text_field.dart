import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.obscure = false,
    this.controller,
    this.icon,
    this.obscureClicked,
    this.validator,
    this.onChanged,
    this.keyboardType,
  });

  final String hint;
  final bool obscure;
  final TextEditingController? controller;
  final IconData? icon;
  final VoidCallback? obscureClicked;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hint),
        SizedBox(height: 20.h),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          obscureText: obscure,
          validator: validator,
          onChanged: onChanged,
          keyboardType: keyboardType,
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                icon,
                size: 20.sp,
                color: AppColors.half_grey,
              ),
              onPressed: obscureClicked,
            ),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Color(0xffEDEDED), width: 1),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Color(0xffEDEDED), width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Color(0xffEDEDED), width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Color(0xffEDEDED), width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Color(0xffEDEDED), width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
// class CustomTextField extends StatelessWidget {
//   final String hint;
//   final bool obscureText;
//   final bool withTitle;
//   final TextEditingController controller;
//   final FormFieldValidator<String>? validator;
//
//   const CustomTextField({
//     super.key,
//     required this.hint,
//     this.obscureText = false,
//     this.withTitle = true,
//     required this.controller,
//     this.validator,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return withTitle
//         ? Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(hint),
//               SizedBox(height: 20.h),
//               TextFormField(
//                 controller: controller,
//                 obscureText: obscureText,
//                 validator: validator,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: AppColors.off_grey,
//                   hintText: hint,
//                   contentPadding: const EdgeInsets.all(16),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.r),
//                     borderSide: BorderSide(color: Color(0xffEDEDED), width: 1),
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.r),
//                     borderSide: BorderSide(color: Color(0xffEDEDED), width: 1),
//                   ),
//                   errorBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.r),
//                     borderSide: BorderSide(color: Color(0xffEDEDED), width: 1),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         : TextFormField(
//             controller: controller,
//             obscureText: obscureText,
//             validator: withTitle ? validator : null,
//             decoration: InputDecoration(
//               constraints: BoxConstraints(maxHeight: 50.h),
//               contentPadding: EdgeInsets.all(16),
//               filled: true,
//               fillColor: AppColors.off_grey,
//               hintText: hint,
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.r),
//                 borderSide: BorderSide(color: Color(0xffEDEDED), width: 1),
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.r),
//                 borderSide: BorderSide(color: Color(0xffEDEDED), width: 1),
//               ),
//             ),
//           );
//   }
// }
