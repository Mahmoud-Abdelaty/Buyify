part of 'widgets/widgets.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserProfileBloc(UserProfileRepoImplement())..add(GetUserDataEvent()),
      child: Scaffold(
        body: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            if (state is UserProfileSuccess) {
              return Column(
                children: [
                  MainUserData(model: state.data),
                  AnotherUserData(model: state.data),
                ],
              );
            } else if (state is UserProfileLoading) {
              return const LoadingState();
            } else {
              return const ErrorState();
            }
          },
        ),
      ),
    );
  }
}
