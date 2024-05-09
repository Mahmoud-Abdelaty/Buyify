part of 'widgets/widgets.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(51.h),
        child: const ProfileAppBar(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 118.w),
                  child: CircleAvatar(
                    radius: 70.r,
                  ),
                ),
                Text(
                  'Mahmoud Abdelaty Hamed',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.semiBold(
                    color: AppColors.dark_blue,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 32.h),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => UserDataSection(
                      title: 'Your Email',
                      prefixIcon: Iconic.envelope,
                      data: 'xxx@gmail.com',
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 20.h),
                    itemCount: 4,
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Points : 45555',
                //       style: AppTextStyle.bold(
                //         color: AppColors.red_velvet,
                //         fontSize: 13.sp,
                //       ),
                //     ),
                //     SizedBox(width: 15.w),
                //     Text(
                //       'Credits : 1000000',
                //       style: AppTextStyle.bold(
                //         color: AppColors.red_velvet,
                //         fontSize: 13.sp,
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
