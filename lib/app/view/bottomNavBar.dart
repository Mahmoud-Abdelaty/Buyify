part of 'widgets/widgets.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarBloc(),
      child: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
        builder: (context, state) {
          var bloc = BlocProvider.of<BottomNavBarBloc>(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              iconSize: 25.sp,
              selectedFontSize: 10.sp,
              unselectedFontSize: 10.sp,
              unselectedItemColor: AppColors.dark_blue,
              selectedItemColor: AppColors.blue_ocean,
              type: BottomNavigationBarType.fixed,
              currentIndex: bloc.currentIndex,
              onTap: (index) {
                bloc.add(ChangeNavBar(index));
              },
              items: const [
                BottomNavigationBarItem(
                  icon: BottomNavBarTab(icon: Iconic.home),
                  label: 'HOME',
                ),
                BottomNavigationBarItem(
                  icon: BottomNavBarTab(icon: Iconic.heart),
                  label: 'WISHLIST',
                ),
                BottomNavigationBarItem(
                  icon: BottomNavBarTab(icon: Iconic.shopping_bag),
                  label: 'ORDER',
                ),
                BottomNavigationBarItem(
                  icon: BottomNavBarTab(icon: Iconic.user),
                  label: 'ACCOUNT',
                ),
              ],
            ),
            body: bloc.screensList[bloc.currentIndex],
          );
        },
      ),
    );
  }
}
