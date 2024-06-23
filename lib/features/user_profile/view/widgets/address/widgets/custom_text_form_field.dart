part of '../../widgets.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
  });

  final TextEditingController? controller;
  final IconData icon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.h),
      child: TextFormField(
        cursorColor: AppColors.blue_ocean,
        controller: controller,
        style: const TextStyle(color: AppColors.blue_ocean),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 15.h),
          hintStyle: AppTextStyle.medium(
            color: AppColors.black,
          ),
          errorStyle: TextStyle(fontSize: 12.sp),
          prefixIcon: Icon(
            icon,
            size: 20.sp,
            color: Colors.grey[400],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: Colors.brown,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: AppColors.blue_ocean,
              width: 2.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: AppColors.black,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.w,
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return '         Please $hintText mustn\'t Empty';
          }
          return null;
        },
      ),
    );
  }
}
