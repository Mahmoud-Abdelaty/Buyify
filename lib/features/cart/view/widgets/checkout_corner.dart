part of 'widgets.dart';

class CheckoutCorner extends StatelessWidget {
  const CheckoutCorner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        int itemsNum = 0;
        itemsNum = state is CartSuccessState ? state.data.cartItems.length : 0;
        return Container(
          height: 280.h,
          width: double.infinity,
          color: AppColors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Column(
              children: [
                Container(
                  height: 170.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(
                      color: AppColors.grey93,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      PriceWidget(
                        title: 'Total item $itemsNum',
                        widget: state is CartSuccessState
                            ? Text(
                                state.data.total.toString(),
                                style: AppTextStyle.semiBold(
                                  fontSize: 16.sp,
                                  color: AppColors.dark_grey,
                                ),
                              )
                            : const UpDownLoader(
                                size: 4,
                                duration: Duration(milliseconds: 200),
                                firstColor: AppColors.dark_grey,
                              ),
                      ),
                      PriceWidget(
                        title: 'Shipping Cost',
                        widget: state is CartSuccessState
                            ? Text(
                                '0',
                                style: AppTextStyle.semiBold(
                                  fontSize: 16.sp,
                                  color: AppColors.dark_grey,
                                ),
                              )
                            : const UpDownLoader(
                                size: 4,
                                duration: Duration(milliseconds: 200),
                                firstColor: AppColors.dark_grey,
                              ),
                      ),
                      const LineSeparate(
                        width: 280,
                        color: AppColors.grey93,
                      ),
                      PriceWidget(
                        title: 'Total Price',
                        widget: state is CartSuccessState
                            ? Text(
                                state.data.total.toString(),
                                style: AppTextStyle.semiBold(
                                  fontSize: 16.sp,
                                  color: AppColors.dark_grey,
                                ),
                              )
                            : const UpDownLoader(
                                size: 4,
                                duration: Duration(milliseconds: 200),
                                firstColor: AppColors.dark_grey,
                              ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                const CheckoutButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}
