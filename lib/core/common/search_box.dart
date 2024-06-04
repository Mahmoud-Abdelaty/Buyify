part of '../../features/home/view/widget/widgets.dart';

class SearchBox extends StatelessWidget {
  SearchBox({super.key, this.enabled = false, this.onChanged});

  bool enabled;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 25.h, 20.w, 20.h),
      child: GestureDetector(
        onTap: () {
          if (enabled == false) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchView(),
              ),
            );
          }
        },
        child: Container(
          width: 325.w,
          height: 50.h,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: AppColors.alabaster,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: TextField(
            enabled: enabled,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: 'Search Product Name',
              hintStyle: AppTextStyle.medium(
                fontSize: 14.sp,
                color: AppColors.grey,
              ),
              suffixIcon: Icon(
                size: 20.sp,
                Iconic.search,
                color: AppColors.dark_blue,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
