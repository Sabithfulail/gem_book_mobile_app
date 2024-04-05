class Add {
  String imageGem;
  String imageCerti;
  String name;
  String price;
  String shape;
  String type;
  String colour;
  String details;
  String weight;
  String sellerName;
  String contactNumber;
  String email;
  String addID;
  String uid;

  Add({
    required this.imageGem,
    required this.imageCerti,
    required this.name,
    required this.price,
    required this.shape,
    required this.type,
    required this.colour,
    required this.details,
    required this.weight,
    required this.sellerName,
    required this.contactNumber,
    required this.email,
    required this.addID,
    required this.uid,
  });


  Add.fromJson(Map<String, Object?> json)
      : this(
    imageGem: json['imageGem']! as String,
    imageCerti: json['imageCerti']! as String,
    name: json['name']! as String,
    price: json['price']! as String,
    shape: json['shape']! as String,
    type: json['type']! as String,
    colour: json['colour']! as String,
    details: json['details']! as String,
    weight: json['weight']! as String,
    sellerName: json['sellerName']! as String,
    contactNumber: json['contactNumber']! as String,
    email: json['email']! as String,
    addID: json['addID']! as String ,
    uid: json['uid']! as String,
  );

  Add copyWith({
    String? imageGem,
    String? imageCerti,
    String? name,
    String? price,
    String? shape,
    String? type,
    String? colour,
    String? details,
    String? weight,
    String? sellerName,
    String? contactNumber,
    String? email,
    String? addID,
    String? uid,
  }) {
    return Add(imageGem: imageGem ?? this.imageGem,
        imageCerti: imageCerti  ?? this.imageCerti,
        name: name ?? this.name,
        price: price ?? this.price,
        shape: shape  ?? this.shape,
        type: type ?? this.type,
        colour: colour ?? this.colour,
        details: details ?? this.details,
        weight: weight ?? this.weight,
        sellerName: sellerName ?? this.sellerName,
        contactNumber: contactNumber ?? this.contactNumber,
      email: email ?? this.email,
      addID: addID ?? this.addID,
      uid: uid ?? this.uid,
    );
  }
  Map<String , Object?> tojson(){
    return {
      'imageGem' : imageGem,
      'imageCerti' : imageCerti,
      'name' : name,
      'price' : price,
      'shape' : shape,
      'type' : type,
      'colour' : colour,
      'details' : details,
      'weight' : weight,
      'sellerName' : sellerName,
      'contactNumber' : contactNumber,
      'email' : email,
      'addID' : addID,
      'uid' : uid,
    };
  }
}
