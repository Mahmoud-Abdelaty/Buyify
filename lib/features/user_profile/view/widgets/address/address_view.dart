part of '../widgets.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProfileBloc(UserProfileRepoImplement())
        ..add(GetUserAddressEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Address',
          style: AppTextStyle.medium(fontSize: 15.sp),
          actions: [
            Builder(
              builder: (context) => IconButton(
                onPressed: () async {
                  final statue = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddAddress(),
                    ),
                  );
                  if (statue == true) {
                    BlocProvider.of<UserProfileBloc>(context)
                        .add(GetUserAddressEvent());
                  }
                },
                icon: Icon(
                  Iconic.plus_bold,
                  size: 15.sp,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
            if (state is UserAddressSuccess) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saved Address',
                      style: AppTextStyle.semiBold(
                        fontSize: 17.sp,
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 25.h),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            AddressItem(model: state.data.addresses[index]),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20.h),
                        itemCount: state.data.addresses.length,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is UserAddressLoading) {
              return const LoadingState();
            } else if (state is UserAddressError) {
              return const ErrorState();
            } else {
              return const LoadingState();
            }
          },
        ),
      ),
    );
  }
}
