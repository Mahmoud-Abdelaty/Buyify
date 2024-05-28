part of 'widgets.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    required this.title,
    required this.price,
    this.priceColor = AppColors.dark_grey,
  });

  final String title;
  final num price;
  final Color? priceColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyle.medium(
              fontSize: 15.sp,
              color: AppColors.dark_grey,
            ),
          ),
          const Spacer(),
          Text(
            price.toString(),
            style: AppTextStyle.semiBold(
              fontSize: 16.sp,
              color: priceColor,
            ),
          ),
        ],
      ),
    );
  }
}
