part of 'widgets/widgets.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double top = 0;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            scrolledUnderElevation: 0,
            elevation: 0,
            expandedHeight: 220.h,
            pinned: true,
            flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
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
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: CircleAvatar(
                          radius: 18.r,
                        ),
                      ),
                    Text(
                      'Mahmoud Abdelaty Hamed',
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                background: Padding(
                  padding: EdgeInsets.only(bottom: 70.h, top: 20.h),
                  child: CircleAvatar(
                    radius: 70.r,
                  ),
                ),
              );
            }),
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
