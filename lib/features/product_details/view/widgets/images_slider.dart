part of 'widgets.dart';

class ImagesSlider extends StatelessWidget {
  const ImagesSlider({super.key, required this.imagesList});

  final List<String> imagesList;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imagesList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Container(
          alignment: AlignmentDirectional.center,
          child: Stack(
            children: [
              ImageBox(
                height: 280.h,
                imageUrl: imagesList[itemIndex],
              ),
              Positioned(
                  bottom: 0.h,
                  left: 10.w,
                  child: Text(
                    '${itemIndex + 1}/${(imagesList.length)}',
                    style: AppTextStyle.medium(
                      fontSize: 15.sp,
                    ),
                  )),
            ],
          ),
        );
      },
      options: CarouselOptions(
        height: 310.h,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayCurve: Curves.linear,
        enlargeCenterPage: true,
      ),
    );

    // return FanCarouselImageSlider(
    //   imagesLink: imagesList,
    //   sliderHeight: 250.h,
    //   imageFitMode: BoxFit.fill,
    //   imageRadius: 10.r,
    //   showArrowNav: false,
    //   sidesOpacity: 0,
    //   currentItemShadow: const [
    //     BoxShadow(color: AppColors.white),
    //     BoxShadow(color: AppColors.white),
    //   ],
    //   indicatorActiveColor: AppColors.blue_ocean,
    //   indicatorDeactiveColor: AppColors.half_grey,
    //   autoPlay: true,
    //   isAssets: false,
    //   initalPageIndex: 0,
    //   expandedCloseBtn: Container(
    //     color: AppColors.white,
    //     child: CircleAvatar(
    //       radius: 25.r,
    //       backgroundColor: AppColors.dark_blue,
    //       child: const Icon(
    //         Iconic.cross_small,
    //         color: AppColors.white,
    //       ),
    //     ),
    //   ),
    //   expandedCloseBtnAlign: AlignmentDirectional.bottomCenter,
    //   expandedImageFitMode: BoxFit.contain,
    // );
  }
}
