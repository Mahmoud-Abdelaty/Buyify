part of 'widgets.dart';

class ImageBox extends StatelessWidget {
  const ImageBox({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315.w,
      height: 150.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          errorWidget: (context, url, error) => Icon(
            Iconic.exclamation_bold,
            size: 60.sp,
            color: AppColors.dark_red,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
