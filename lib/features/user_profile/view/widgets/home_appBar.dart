part of 'widgets.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Profile',
      leadingButton: false,
      style: AppTextStyle.bold(
        fontSize: 18.sp,
        color: AppColors.blue_ocean,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Iconic.settings,
            size: 23.sp,
          ),
        ),
      ],
    );
  }
}
