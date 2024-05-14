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
                  SliverAppBarCustom(model: state.data),
                  UserData(model: state.data),
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
