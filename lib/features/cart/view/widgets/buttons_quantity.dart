part of 'widgets.dart';

class ButtonsQuantity extends StatelessWidget {
  const ButtonsQuantity(
      {super.key, required this.quantity, required this.cartId});

  final num quantity;
  final num cartId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final cartBloc = BlocProvider.of<CartBloc>(context);
        cartBloc.quantity = quantity;
        return Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Container(
            height: 30.h,
            decoration: BoxDecoration(
              color: AppColors.blue_ocean,
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    quantity != 1
                        ? cartBloc.add(ChangeEvent(quantity, 'minus', cartId))
                        : null;
                  },
                  child: Icon(
                    AppIcons.minus4,
                    size: 25.sp,
                    color: AppColors.white,
                  ),
                ),
                CircleAvatar(
                  radius: 18.r,
                  backgroundColor: AppColors.white,
                  child: Text(
                    cartBloc.quantity.toString(),
                    style: AppTextStyle.semiBold(
                      fontSize: 17.sp,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cartBloc.add(ChangeEvent(quantity, 'plus', cartId));
                  },
                  child: Icon(
                    AppIcons.add4,
                    size: 25.sp,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
