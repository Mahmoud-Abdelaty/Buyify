part of 'widgets.dart';

class UserData extends StatelessWidget {
  const UserData({super.key, required this.model});

  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          UserDataSection(
            title: 'Your Email',
            prefixIcon: Iconic.envelope,
            data: model.email,
          ),
          UserDataSection(
            title: 'Your Phone',
            prefixIcon: Iconic.envelope,
            data: model.phone,
          ),
          UserDataSection(
            title: 'Your Points',
            prefixIcon: Iconic.menu_dots_vertical_bold,
            data: model.points.toString(),
          ),
          UserDataSection(
            title: 'Your Credit',
            prefixIcon: Iconic.credit_card,
            data: model.credit.toString(),
          ),
          const OptionContainer(type: 'Language'),
          const OptionContainer(type: 'Theme'),
        ],
      ),
    );
  }
}
