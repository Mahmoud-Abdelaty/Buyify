part of 'widgets.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsBloc(ProductDetailsRepoImplement()),
      child: Padding(
        padding: EdgeInsets.only(left: 25.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
              builder: (context, state) {
                return CustomButtons(
                  color: AppColors.dark_red,
                  onTap: () {
                    BlocProvider.of<ProductDetailsBloc>(context)
                        .add(AddProductFav(100));
                    if (state is ProductAddedFavSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        content: AwesomeSnackbarContent(
                          title: 'Done',
                          message: state.data.message,
                          contentType: ContentType.success,
                        ),
                      ));
                    } else if (state is ProductAddedFavFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        content: AwesomeSnackbarContent(
                          title: 'Not Done',
                          message: 'Not Done',
                          contentType: ContentType.failure,
                        ),
                      ));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Added',
                        style: AppTextStyle.medium(
                          fontSize: 14.sp,
                          color: AppColors.white,
                        ),
                      ),
                      state is ProductAddedFavLoading
                          ? const UpDownLoader(
                              size: 4,
                              duration: Duration(milliseconds: 200),
                              firstColor: Colors.white,
                            )
                          : Icon(
                              Iconic.heart_solid,
                              color: AppColors.white,
                              size: 20.sp,
                            ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(width: 19.w),
            CustomButtons(
              color: AppColors.blue_ocean,
              child: Center(
                child: Text(
                  'Add to Cart',
                  style: AppTextStyle.medium(
                    fontSize: 14.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
