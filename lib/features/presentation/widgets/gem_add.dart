class GemAdd {
  final String imageGem;
  final String imageCertificate;
  final String name;
  final String price;
  final String? shape;
  final String type;
  final String? color;
  final String details;
  final String weight;
  final String? sellerName;
  final String? sellerContactNumber;
  final String? uid;
  final String? gemAddID;

  GemAdd({
    required this.imageGem,
    this.uid,
    required this.imageCertificate,
    required this.name,
    required this.price,
    required this.type,
    this.details = "",
    this.weight = "",
    this.color,
    this.sellerName,
    this.shape,
    this.sellerContactNumber,
    this.gemAddID,
  });
}
