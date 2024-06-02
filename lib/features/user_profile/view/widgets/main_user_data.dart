part of 'widgets.dart';

class MainUserData extends StatelessWidget {
  const MainUserData({super.key, required this.model});

  final UserModel model;
  @override
  Widget build(BuildContext context) {
    var mainOption = getMainOptionList(model, context);
    return SizedBox(
      height: 350.h,
      child: Stack(
        children: [
          Container(
            height: 250.h,
            decoration: BoxDecoration(
              color: AppColors.blue_ocean,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18.r),
                bottomRight: Radius.circular(18.r),
              ),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Column(
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 9.h),
                    child: Text(
                      model.name,
                      style: AppTextStyle.medium(
                        color: AppColors.white,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  Text(
                    model.email,
                    style: AppTextStyle.medium(
                      color: AppColors.white,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.h,
            left: 17.w,
            child: Container(
              height: 130.h,
              width: 340.w,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6.r,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: mainOption[index].onTap,
                  child: OptionUserProfile(optionModel: mainOption[index]),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 25.h,
                ),
                itemCount: mainOption.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
