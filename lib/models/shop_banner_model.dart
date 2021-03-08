class ShopBanner {
  final String bannerId;
  final String bannerBgImage;

  ShopBanner({
    this.bannerId,
    this.bannerBgImage,
  });
}

class ShopBannerData {
  List<ShopBanner> bannerData = [
    ShopBanner(
      bannerId: "1",
      bannerBgImage: "assets/images/banner1.png",
    ),
    ShopBanner(
      bannerId: "2",
      bannerBgImage: "assets/images/banner2.png",
    ),
    ShopBanner(
      bannerId: "3",
      bannerBgImage: "assets/images/banner3.png",
    ),
  ];
}
