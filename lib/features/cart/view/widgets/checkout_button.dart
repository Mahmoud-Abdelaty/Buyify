part of 'widgets.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButtons(
      onTap: () {},
      color: AppColors.blue_ocean,
      width: 300.w,
      child: Text(
        'Checkout',
        style: AppTextStyle.bold(
          fontSize: 17.sp,
        ),
      ),
    );
  }
}
