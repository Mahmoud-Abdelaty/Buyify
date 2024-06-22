part of '../widgets.dart';

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
                SizedBox(width: 22.w),
                Text(
                  name,
                  style: AppTextStyle.medium(
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
            DataBox(
              title: 'Email Address',
              data: email,
            ),
            DataBox(
              title: 'Phone Number',
              data: phone,
            ),
          ],
        ),
      ),
    );
  }
}
