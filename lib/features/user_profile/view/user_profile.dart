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
                    scrolledUnderElevation: 0,
                    elevation: 0,
                    expandedHeight: 220.h,
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
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 18.r,
                                    backgroundImage: CachedNetworkImageProvider(
                                      state.data.image ??
                                          'https://student.valuxapps.com/storage/assets/defaults/user.jpg',
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
                                EdgeInsets.fromLTRB(95.w, 20.h, 95.w, 60.h),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    state.data.image ??
                                        'https://student.valuxapps.com/storage/assets/defaults/user.jpg',
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
                      data: 'xxx@gmail.com',
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: UserDataSection(
                      title: 'Your Email',
                      prefixIcon: Iconic.envelope,
                      data: 'xxx@gmail.com',
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: UserDataSection(
                      title: 'Your Email',
                      prefixIcon: Iconic.envelope,
                      data: 'xxx@gmail.com',
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: UserDataSection(
                      title: 'Your Email',
                      prefixIcon: Iconic.envelope,
                      data: 'xxx@gmail.com',
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: UserDataSection(
                      title: 'Your Email',
                      prefixIcon: Iconic.envelope,
                      data: 'xxx@gmail.com',
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: UserDataSection(
                      title: 'Your Email',
                      prefixIcon: Iconic.envelope,
                      data: 'xxx@gmail.com',
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 150.h,
                    ),
                  ),
                ],
              );
            } else if (state is UserProfileLoading) {
              return LoadingState();
            } else {
              // return ErrorState();
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
