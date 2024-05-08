part of 'widgets.dart';

class BottomNavBarTab extends StatelessWidget {
  const BottomNavBarTab({super.key, required this.icon});

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Icon(icon),
    );
  }
}
