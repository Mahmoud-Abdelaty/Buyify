part of 'widgets.dart';

class CheckoutCorner extends StatelessWidget {
  const CheckoutCorner({super.key, required this.data});

  final CartDataModel data;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
      width: double.infinity,
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          children: [
            Container(
              height: 150.h,
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
                      title: 'Total item ${data.cartItems.length}',
                      price: data.total),
                  PriceWidget(
                    title: 'Shipping Cost',
                    price: data.total,
                  ),
                  const LineSeparate(
                    width: 280,
                    color: AppColors.grey93,
                  ),
                  PriceWidget(
                    title: 'Total Price',
                    price: data.total,
                    priceColor: AppColors.blue_ocean,
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
  }
}
