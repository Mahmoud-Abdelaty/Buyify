part of 'widgets.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({super.key, required this.model});

  final AddressDetailsModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: AppColors.dark_grey,
              width: 1.8.w,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.name,
              style: AppTextStyle.medium(fontSize: 16.sp),
            ),
            AddressInfoWidget(
              data: model.details,
            ),
            AddressInfoWidget(
              data: ' ${model.region}, ${model.city}',
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Container(
                  width: 85.w,
                  height: 50.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.blue_ocean,
                    borderRadius: BorderRadius.circular(17.r),
                  ),
                  child: Text(
                    'Edit',
                    style: AppTextStyle.semiBold(
                      fontSize: 17.sp,
                      color: AppColors.white,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Iconic.trash_straight,
                      size: 23.sp,
                    )),
              ],
            ),
          ],
        ));
  }
}
