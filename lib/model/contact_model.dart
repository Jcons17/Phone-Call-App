import 'dart:convert';

class Contact {

  final int? idContact;
  final String firstName;
  final String? lastName;
  final String numberPhone;
  String? pathImage;
  final String? email;  

  Contact({
    required this.idContact,
    required this.firstName,
    this.lastName,
    required this.numberPhone,
    this.pathImage,
    this.email,
  });


  Contact copyWith({
    int? idContact,
    String? firstName,
    String? lastName,
    String? numberPhone,
    String? pathImage,
    String? email,
  }) {
    return Contact(
      idContact: idContact ?? this.idContact,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      numberPhone: numberPhone ?? this.numberPhone,
      pathImage: pathImage ?? this.pathImage,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idContact': idContact,
      'firstName': firstName,
      'lastName': lastName,
      'numberPhone': numberPhone,
      'pathImage': pathImage,
      'email': email,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      idContact: map['idContact']?.toInt(),
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'],
      numberPhone: map['numberPhone'] ?? '',
      pathImage: map['pathImage'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) => Contact.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Contact(idContact: $idContact, firstName: $firstName, lastName: $lastName, numberPhone: $numberPhone, pathImage: $pathImage, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Contact &&
      other.idContact == idContact &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.numberPhone == numberPhone &&
      other.pathImage == pathImage &&
      other.email == email;
  }

  @override
  int get hashCode {
    return idContact.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      numberPhone.hashCode ^
      pathImage.hashCode ^
      email.hashCode;
  }
} 
