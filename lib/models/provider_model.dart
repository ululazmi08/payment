class ProviderModel {
  final int price;
  final String time;
  final String image;
  final Detail detail;

  ProviderModel({
    required this.price,
    required this.time,
    required this.image,
    required this.detail,
  });
}

class Detail {
  final String provider;
  final String custId;
  final String servicePackage;

  Detail({
    required this.provider,
    required this.custId,
    required this.servicePackage,
  });
}
