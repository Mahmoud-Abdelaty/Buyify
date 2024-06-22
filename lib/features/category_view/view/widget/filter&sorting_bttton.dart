part of 'widgets.dart';

class FilterAndSortingButton extends StatelessWidget {
  const FilterAndSortingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButtons(
      onTap: () => showGeneralDialog(
        barrierLabel: "Product Action",
        barrierDismissible: true,
        transitionDuration: const Duration(milliseconds: 700),
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              margin: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
              child: const DialogFilteringAndSorting(),
            ),
          );
        },
        transitionBuilder: (context, anim1, anim2, child) {
          return SlideTransition(
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(anim1),
            child: child,
          );
        },
      ),
      color: Colors.white,
      width: 325.w,
      border: Border.all(color: Colors.black),
      child: Text(
        'Filter & Sorting',
        style: AppTextStyle.medium(
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
