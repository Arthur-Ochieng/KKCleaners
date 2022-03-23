class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? county;
  String? constituency;
  String? phoneNumber;

  UserModel ({this.uid, this.email, this.firstName, this.secondName, this.phoneNumber, this.county, this.constituency});


  //data from the server
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map('uid'),
      email: map('email'),
      firstName: map('firstName'),
      secondName: map('secondName'),
      county: map('county'),
      constituency: map('constituency'),
      phoneNumber: map('phoneNumber'),
    );
  }

  //sending data to the server
  Map <String, dynamic> toMap(){
    return{
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
      'county': county,
      'constituency': constituency,
      'phoneNumber': phoneNumber,
    };
  }
}
