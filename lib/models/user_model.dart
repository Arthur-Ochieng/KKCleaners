class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? address;
  String? type;
  String? phoneNumber;
  String? ratings;

  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.secondName,
    this.phoneNumber,
    this.address,
    this.type,
    this.ratings,
  });

  //data from the server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map('uid'),
      email: map('email'),
      firstName: map('firstName'),
      secondName: map('secondName'),
      address: map('address'),
      type: map('type'),
      phoneNumber: map('phoneNumber'),
      ratings: map('ratings'),
    );
  }

  //sending data to the server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'address': address,
      'type': type,
      'phoneNumber': phoneNumber,
      'ratings': ratings,
    };
  }
}
