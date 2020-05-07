import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job_portal/constants/constants.dart';
import 'package:flutter_job_portal/global.dart';
import 'package:flutter_job_portal/models/appliedJobModel.dart';

class AppliedJobsScreen extends StatelessWidget {
  final AppliedJobModel appliedJob;

  const AppliedJobsScreen({Key key, @required this.appliedJob})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height / 2,
              child: Image.network(
                "https://cdn.pixabay.com/photo/2014/02/28/13/47/job-search-276893_1280.jpg",
                fit: BoxFit.cover,
                color: Colors.black38,
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: MediaQuery.of(context).size.height / 2,
              child: Container(
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Text(
                          appliedJob.title,
                          style: Theme.of(context).textTheme.headline,
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            OnDelete();
                            Navigator.of(context).pushNamed(JOB_LIST);
                          },
                        ),
                      ],
                      ),
                      Text(
                        appliedJob.location,
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .apply(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        "Job Description",
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      Text(
                        appliedJob.description,
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .apply(color: Colors.grey),
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.height * .7,
                          height: 45,
                          child: Text("Applied On : " + appliedJob.appliedDate,
                              textDirection: TextDirection.ltr))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void OnDelete(){
    Firestore.instance.collection("appliedJobs").document(appliedJob.id).delete();

  }
}
