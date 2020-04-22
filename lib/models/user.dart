import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String uid;
  String firstname;
  String lastname;
  String email;
  String mobile;
  String password;
  DocumentReference reference;

  User(
      {this.id,
      this.uid,
      this.firstname,
      this.lastname,
      this.email,
      this.mobile,
      this.password});

  User.fromMap(Map<String, dynamic> map, {this.reference}) {
    id = map['id'];
    uid = map['uid'];
    firstname = map['firstname'];
    lastname = map['lastname'];
    email = map['email'];
    mobile = map['mobile'];
    password = map['password'];
  }

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson() {
    return {
      "id": id,
      "uid": uid,
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "mobile": mobile,
      "password": password
    };
  }
}
