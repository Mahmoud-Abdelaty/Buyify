part of '../../widgets.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProfileBloc(UserProfileRepoImplement()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Add Address',
          style: AppTextStyle.medium(fontSize: 15.sp),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  icon: Iconic.user,
                  hintText: 'Name',
                ),
                CustomTextFormField(
                  controller: _cityController,
                  icon: Iconic.location_alt,
                  hintText: 'City',
                ),
                CustomTextFormField(
                  controller: _regionController,
                  icon: Iconic.map,
                  hintText: 'Region',
                ),
                CustomTextFormField(
                  controller: _streetController,
                  icon: Iconic.road,
                  hintText: 'Street',
                ),
                const SizedBox(height: 50),
                BlocBuilder<UserProfileBloc, UserProfileState>(
                  builder: (context, state) {
                    return CustomButtons(
                      color: AppColors.blue_ocean,
                      width: 140.w,
                      height: 60.h,
                      child: state is AddUserAddressLoading
                          ? const UpDownLoaderWidget()
                          : Text(
                              'Add',
                              style: AppTextStyle.semiBold(
                                fontSize: 17,
                              ),
                            ),
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<UserProfileBloc>(context).add(
                            AddUserAddressEvent(
                              {
                                "name": _nameController.text,
                                "city": _cityController.text,
                                "region": _regionController.text,
                                "details": _streetController.text,
                                "latitude": 30.0616863,
                                "longitude": 31.3260088,
                                "notes": "Work address",
                              },
                            ),
                          );

                          BlocProvider.of<UserProfileBloc>(context)
                              .stream
                              .listen((state) {
                            if (state is AddUserAddressSuccess) {
                              state.data.status == true
                                  ? Navigator.pop(context, true)
                                  : showSnackBar(
                                      context: context,
                                      message: state.data.message,
                                      title: 'Error',
                                      contentType: ContentType.failure,
                                    );
                            }
                          });
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _cityController.dispose();
    _regionController.dispose();
    _streetController.dispose();
  }
}
