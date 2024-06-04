part of 'widgets.dart';

class ImageProduct extends StatelessWidget {
  const ImageProduct({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: 80.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: CachedNetworkImage(
          imageUrl: image,
          errorWidget: (context, url, error) => Icon(
            Iconic.exclamation_bold,
            size: 60.sp,
            color: AppColors.dark_red,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
