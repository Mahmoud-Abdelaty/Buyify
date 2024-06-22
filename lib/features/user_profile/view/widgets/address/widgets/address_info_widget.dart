part of '../../widgets.dart';

class AddressInfoWidget extends StatelessWidget {
  const AddressInfoWidget({super.key, required this.data});

  final String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Text(
        data,
        style: AppTextStyle.medium(
          fontSize: 16.sp,
          color: AppColors.half_grey,
        ),
      ),
    );
  }
}
