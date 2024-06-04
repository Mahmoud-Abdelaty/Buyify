part of '../../features/home/view/widget/widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.style,
    this.actions,
    this.leadingButton = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(66.h);

  final String title;
  final List<Widget>? actions;
  final bool leadingButton;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          centerTitle: true,
          scrolledUnderElevation: 0,
          title: Text(
            title,
            style: style,
          ),
          leading: leadingButton
              ? IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Iconic.angle_small_left,
                    size: 13.sp,
                  ),
                )
              : null,
          actions: actions,
        ),
        const LineSeparate(),
      ],
    );
  }
}
