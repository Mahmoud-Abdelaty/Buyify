part of 'widgets.dart';

class ImageBox extends StatelessWidget {
  ImageBox(
      {super.key, required this.imageUrl, this.width = 315, this.height = 150});

  final String imageUrl;
  double width;
  double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
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
