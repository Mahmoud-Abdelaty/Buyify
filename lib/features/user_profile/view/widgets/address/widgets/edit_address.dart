part of '../../widgets.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({super.key, required this.model});

  final AddressDetailsModel model;

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.model.name;
    _cityController.text = widget.model.city;
    _regionController.text = widget.model.region;
    _streetController.text = widget.model.details;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProfileBloc(UserProfileRepoImplement()),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Edit Address',
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
                      child: state is UpdateUserAddressLoading
                          ? const UpDownLoaderWidget()
                          : Text(
                              'Update',
                              style: AppTextStyle.semiBold(
                                fontSize: 17,
                              ),
                            ),
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<UserProfileBloc>(context).add(
                            UpdateUserAddressEvent(
                              widget.model.id,
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
                            if (state is UpdateUserAddressSuccess) {
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
