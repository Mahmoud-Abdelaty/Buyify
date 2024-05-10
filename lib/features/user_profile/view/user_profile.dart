part of 'widgets/widgets.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.deepPurple,
            expandedHeight: 210.h,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.symmetric(horizontal: 118.w),
                child: CircleAvatar(
                  radius: 70.r,
                ),
              ),
              title: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 0),
                child: Text(
                  'Mahmoud Abdelaty ',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.semiBold(
                    color: AppColors.dark_blue,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              titlePadding:
                  // EdgeInsets.zero,
                  EdgeInsets.only(left: 50.w, bottom: 12.h),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => UserDataSection(
                    title: 'Your Email',
                    prefixIcon: Iconic.envelope,
                    data: 'xxx@gmail.com',
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 20.h),
                  itemCount: 4,
                ),
                // Add more SliverChildListDelegate items for other content
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150.h,
            ),
          ),
        ],
      ),
    );
  }
}
