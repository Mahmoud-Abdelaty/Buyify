part of 'widgets.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});

  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
      child: Container(
        height: 120.h,
        width: 300.w,
        decoration: BoxDecoration(
          color: AppColors.grey93,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 6.r,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(15.w, 15.h, 0, 15.h),
          child: Row(
            children: [
              ImageProduct(image: cartItem.product.image),
              SizedBox(width: 10.w),
              ProductData(
                name: cartItem.product.name,
                price: cartItem.product.price,
                quantity: cartItem.quantity,
                id: cartItem.id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
