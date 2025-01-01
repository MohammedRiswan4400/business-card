class CardModel2 {
  final String imageURL;

  CardModel2({
    required this.imageURL,
  });
}

class CardModel {
  final String cardID;
  final String name;
  final String title;
  final String companyName;
  final String location;
  final String phoneNumber;
  final String email;
  final String companyDetails;
  final bool isGradient;
  bool isSaved;
  final String color;
  final String gradientFirstColor;
  final String gradientSecondColor;

  CardModel({
    required this.cardID,
    required this.name,
    required this.title,
    required this.companyName,
    required this.location,
    required this.phoneNumber,
    required this.email,
    required this.companyDetails,
    required this.isGradient,
    required this.isSaved,
    required this.color,
    required this.gradientFirstColor,
    required this.gradientSecondColor,
  });

  // Convert the model to a Firestore-compatible map
  Map<String, dynamic> toMap() {
    return {
      'card-id': cardID,
      'name': name,
      'title': title,
      'company-name': companyName,
      'location': location,
      'phone-number': phoneNumber,
      'email': email,
      'company-details': companyDetails,
      'is-gradient': isGradient,
      'is-saved': isSaved,
      'color': color,
      'gradient-first-color': gradientFirstColor,
      'gradient-second-color': gradientSecondColor,
    };
  }

  // Create a model instance from Firestore data
  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      cardID: map['card-id'] ?? '',
      name: map['name'] ?? '',
      title: map['title'] ?? '',
      companyName: map['company-name'] ?? '',
      location: map['location'] ?? '',
      phoneNumber: map['phone-number'] ?? '',
      email: map['email'] ?? '',
      companyDetails: map['company-details'] ?? '',
      isGradient: map['is-gradient'] ?? false,
      isSaved: map['is-saved'] ?? false,
      color: map['color'] ?? '',
      gradientFirstColor: map['gradient-first-color'] ?? '',
      gradientSecondColor: map['gradient-second-color'] ?? '',
    );
  }
}
