part of 'widgets.dart';

class AccountView extends StatelessWidget {
  const AccountView(
      {super.key,
      required this.name,
      required this.email,
      required this.phone});

  final String name;
  final String email;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Detail Profile',
        style: AppTextStyle.medium(fontSize: 15.sp),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Iconic.pencil,
              size: 20.sp,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 55.r,
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundImage: const CachedNetworkImageProvider(
                      'https://media.istockphoto.com/id/1132758418/photo/close-up-portrait-of-her-she-nice-attractive-puzzled-ignorant-wavy-haired-girl-showing.jpg?s=612x612&w=0&k=20&c=3G3eEg2RHg6AmVDbZCIzVo3n-1kFnE-61sgH3qDdyIo=',
                    ),
                  ),
                ),
                SizedBox(width: 25.w),
                Text(
                  name,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: Row(
                children: [
                  Icon(
                    Iconic.envelope,
                    size: 23.sp,
                    color: AppColors.blue_ocean,
                  ),
                  SizedBox(width: 25.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email Address',
                        style: AppTextStyle.regular(
                          fontSize: 15.sp,
                        ),
                      ),
                      Text(
                        email,
                        style: AppTextStyle.regular(
                          fontSize: 15.sp,
                          color: AppColors.half_grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(
                  Iconic.envelope,
                  size: 23.sp,
                  color: AppColors.blue_ocean,
                ),
                SizedBox(width: 25.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone Number',
                      style: AppTextStyle.regular(
                        fontSize: 15.sp,
                      ),
                    ),
                    Text(
                      phone,
                      style: AppTextStyle.regular(
                        fontSize: 15.sp,
                        color: AppColors.half_grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
