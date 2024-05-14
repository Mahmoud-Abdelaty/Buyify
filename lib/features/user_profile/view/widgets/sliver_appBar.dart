part of 'widgets.dart';

class SliverAppBarCustom extends StatelessWidget {
  const SliverAppBarCustom({super.key, required this.model});

  final UserModel model;
  @override
  Widget build(BuildContext context) {
    double top = 0;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      // scrolledUnderElevation: 0,
      expandedHeight: 250.h,
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
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundImage: const CachedNetworkImageProvider(
                        'http://www.hotavatars.com/wp-content/uploads/2019/01/I80W1Q0.png',
                      ),
                    ),
                  ),
                Text(
                  model.name,
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            background: Padding(
              padding: EdgeInsets.fromLTRB(80.w, 20.h, 80.w, 60.h),
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
    );
  }
}
