part of 'widgets/widgets.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double top = 0;
    return BlocProvider(
      create: (context) =>
          UserProfileBloc(UserProfileRepoImplement())..add(GetUserDataEvent()),
      child: Scaffold(
        body: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            if (state is UserProfileSuccess) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    // scrolledUnderElevation: 0,
                    expandedHeight: 250.h,
                    pinned: true,
                    flexibleSpace: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        top = constraints.biggest.height;
                        return FlexibleSpaceBar(
                          centerTitle: true,
                          title: Row(
                            mainAxisAlignment: top <= 80.h
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.center,
                            children: [
                              if (top <= 80.h)
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: CircleAvatar(
                                    radius: 20.r,
                                    backgroundImage:
                                        const CachedNetworkImageProvider(
                                      'http://www.hotavatars.com/wp-content/uploads/2019/01/I80W1Q0.png',
                                    ),
                                  ),
                                ),
                              Text(
                                state.data.name,
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          background: Padding(
                            padding:
                                EdgeInsets.fromLTRB(80.w, 20.h, 80.w, 60.h),
                            child: Container(
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: NetworkImage(
                                    'http://www.hotavatars.com/wp-content/uploads/2019/01/I80W1Q0.png',
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: UserDataSection(
                      title: 'Your Email',
                      prefixIcon: Iconic.envelope,
                      data: state.data.email,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: UserDataSection(
                      title: 'Your Phone',
                      prefixIcon: Iconic.envelope,
                      data: state.data.phone,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: UserDataSection(
                      title: 'Your Points',
                      prefixIcon: Iconic.menu_dots_vertical_bold,
                      data: state.data.points.toString(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: UserDataSection(
                      title: 'Your Credit',
                      prefixIcon: Iconic.credit_card,
                      data: state.data.credit.toString(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Language',
                            style: AppTextStyle.semiBold(
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            width: 323.w,
                            height: 52.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.dark_grey,
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Theme',
                            style: AppTextStyle.semiBold(
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            width: 323.w,
                            height: 52.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.dark_grey,
                              ),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is UserProfileLoading) {
              return const LoadingState();
            } else {
              // return ErrorState();
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
