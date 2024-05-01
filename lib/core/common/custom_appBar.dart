part of '../../features/home/view/widget/widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.title, this.actions});

  @override
  Size get preferredSize => Size.fromHeight(51.h);

  final String title;
  List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          centerTitle: true,
          scrolledUnderElevation: 0,
          title: Text(
            title,
            style: AppTextStyle.medium(fontSize: 16.sp),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Iconic.angle_small_left,
              size: 13.sp,
            ),
          ),
          actions: actions,
        ),
        const LineSeparate(),
      ],
    );
  }
}
