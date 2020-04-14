import 'package:cloud_firestore/cloud_firestore.dart';

class JobModel {
  String description;
  String iconUrl;
  String location;
  String salary;
  String title;
  List<String> photos;
  DocumentReference reference;

  JobModel(
      {this.description,
      this.iconUrl,
      this.location,
      this.salary,
      this.title,
      this.photos});

  JobModel.fromMap(Map<String, dynamic> map, {this.reference}) {
    description = map["description"];
    iconUrl = map["iconUrl"];
    location = map["location"];
    salary = map["salary"];
    title = map["title"];
    photos = map["photos"];
  }

  JobModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson() {
    return {
      "description": description,
      "iconUrl": iconUrl,
      "location": location,
      "salary": salary,
      "title": title,
      "photos": photos
    };
  }
}

// class JobModel {
//   final String description, iconUrl, location, salary, title;
//   final List<String> photos;

//   JobModel(
//       {this.photos,
//       this.description,
//       this.iconUrl,
//       this.location,
//       this.salary,
//       this.title});
// }
