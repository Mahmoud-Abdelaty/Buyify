part of '../../widgets.dart';

class DeleteAddressWidget extends StatelessWidget {
  const DeleteAddressWidget({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        return IconButton(
            onPressed: () {
              BlocProvider.of<UserProfileBloc>(context).add(
                DeleteUserAddressEvent(id),
              );

              if (state is DeleteUserAddressSuccess) {
                state.data.status == true
                    ? showSnackBar(
                        context: context,
                        message: state.data.message,
                        title: 'Success',
                        contentType: ContentType.success,
                      )
                    : showSnackBar(
                        context: context,
                        message: state.data.message,
                        title: 'Error',
                        contentType: ContentType.failure,
                      );
              }
            },
            icon: Icon(
              Iconic.trash_straight,
              size: 23.sp,
            ));
      },
    );
  }
}
