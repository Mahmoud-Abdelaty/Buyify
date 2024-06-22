part of 'widgets.dart';

class OptionUserProfile extends StatefulWidget {
  const OptionUserProfile({super.key, required this.optionModel});

  final OptionModel optionModel;

  @override
  State<OptionUserProfile> createState() => _OptionUserProfileState();
}

class _OptionUserProfileState extends State<OptionUserProfile> {
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.optionModel.icon,
          size: widget.optionModel.iconSize ?? 23.sp,
          color: AppColors.blue_ocean,
        ),
        SizedBox(width: 25.w),
        Text(
          widget.optionModel.title,
          style: AppTextStyle.regular(
            fontSize: 15.sp,
          ),
        ),
        const Spacer(),
        !widget.optionModel.switchButton
            ? Icon(
                widget.optionModel.actionIcon,
                size: 14.sp,
                color: AppColors.half_grey,
              )
            : Switch(
                inactiveThumbColor: AppColors.white,
                activeColor: AppColors.blue_ocean,
                inactiveTrackColor: AppColors.half_grey,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                trackOutlineWidth: MaterialStateProperty.all(0),
                value: isSwitch,
                onChanged: (value) {
                  setState(() {
                    isSwitch = value;
                  });
                })
      ],
    );
  }
}
