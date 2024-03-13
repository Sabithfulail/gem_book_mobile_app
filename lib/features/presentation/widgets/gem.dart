

class Gem {
  final String imagePath;
  final String name;
  final String price;
  final String type;
  final String? color;
  final String details;
  final String weight;
  final String certificatePath;


  Gem({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.type,
    this.details = "",
    this.certificatePath = "",
    this.weight = "",
    this.color
  });
}
