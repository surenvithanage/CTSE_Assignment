import 'package:cloud_firestore/cloud_firestore.dart';

class AppliedJobModel {
  String id;
  String description;
  String iconUrl;
  String location;
  String salary;
  String title;
  String userId;
  String appliedDate;
  DocumentReference reference;

  AppliedJobModel(
      {this.id,
        this.description,
        this.iconUrl,
        this.location,
        this.salary,
        this.title,
        this.userId,
      this.appliedDate});

  AppliedJobModel.fromMap(Map<String, dynamic> map, {this.reference}) {
    id = map["id"];
    description = map["description"];
    iconUrl = map["iconUrl"];
    location = map["location"];
    salary = map["salary"];
    title = map["title"];
    userId = map["userId"];
    appliedDate = map["appliedDate"];
  }

  AppliedJobModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson() {
    return {
      "id":id,
      "description": description,
      "iconUrl": iconUrl,
      "location": location,
      "salary": salary,
      "title": title,
      "userId": userId,
      "appliedDate": appliedDate
    };
  }
}

