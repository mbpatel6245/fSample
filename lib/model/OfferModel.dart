class OfferModel {
  final List<OfferBanner> banners;
  final int status;

  OfferModel({
    this.status,
    this.banners,
  });

  factory OfferModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['Banner'] as List;
    print(list.runtimeType);

    List<OfferBanner> bannerList =
        list.map((i) => OfferBanner.fromJson(i)).toList();

    return OfferModel(status: parsedJson['status'], banners: bannerList);
  }
}

class OfferBanner {
  String image;
  String subcatagoryID;

  OfferBanner({
    this.image,
    this.subcatagoryID,
  });

  factory OfferBanner.fromJson(Map<String, dynamic> json) {
    return OfferBanner(
      image: json['Image'],
      subcatagoryID: json['subcatagoryID'],
    );
  }
}
