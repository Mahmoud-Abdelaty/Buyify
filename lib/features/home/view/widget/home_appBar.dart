part of 'widgets.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Buyify',
      leadingButton: false,
      style: AppTextStyle.bold(
        fontSize: 18.sp,
        color: AppColors.blue_ocean,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Iconic.bell_bold,
            size: 20.sp,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.w),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Iconic.shopping_cart_bold,
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}
