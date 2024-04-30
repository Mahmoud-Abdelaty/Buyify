part of 'widgets.dart';

class Banners extends StatelessWidget {
  const Banners({Key? key, required this.list}) : super(key: key);

  final List<BannerModel> list;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: list.length,
      options: CarouselOptions(
        height: 150.h,
        viewportFraction: 1,
        autoPlay: true,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      itemBuilder: (context, index, realIndex) {
        return ImageBox(imageUrl: list[index].image);
      },
    );
  }
}
