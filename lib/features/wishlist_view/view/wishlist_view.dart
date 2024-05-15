part of 'widgets/widgets.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Wishlist',
        leadingButton: false,
        style: AppTextStyle.medium(fontSize: 16.sp),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        itemBuilder: (context, index) => Container(
          height: 100.h,
          width: 100.w,
          color: Colors.greenAccent,
        ),
        separatorBuilder: (context, index) => SizedBox(height: 15.h),
        itemCount: 20,
      ),
    );
  }
}
