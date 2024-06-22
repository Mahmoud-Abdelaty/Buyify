part of 'widgets.dart';

class AnotherUserData extends StatelessWidget {
  const AnotherUserData({super.key, required this.model});

  final UserModel model;
  @override
  Widget build(BuildContext context) {
    var options = getOptionList(model, context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
      child: Container(
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
              onTap: () => options[index].onTap,
              child: OptionUserProfile(optionModel: options[index])),
          separatorBuilder: (context, index) => SizedBox(
            height: 25.h,
          ),
          itemCount: options.length,
        ),
      ),
    );
  }
}
