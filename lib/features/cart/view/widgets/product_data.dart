part of 'widgets.dart';

class ProductData extends StatelessWidget {
  const ProductData(
      {super.key,
      required this.name,
      required this.price,
      required this.quantity,
      required this.id});

  final String name;
  final num price;
  final num quantity;
  final num id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: AppTextStyle.bold(
                        fontSize: 15.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => BlocProvider.of<CartBloc>(context)
                        .add(DeleteCartEvent(id)),
                    icon: Icon(
                      Iconic.cross_small,
                      size: 12.sp,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    price.toString(),
                    style: AppTextStyle.bold(
                      fontSize: 15.sp,
                      color: AppColors.red_velvet,
                    ),
                  ),
                  const Spacer(),
                  ButtonsQuantity(quantity: quantity, cartId: id),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
