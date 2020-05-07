import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job_portal/constants/constants.dart';
import 'package:flutter_job_portal/models/appliedJobModel.dart';
import 'package:flutter_job_portal/models/bottomsheet.dart';
import 'package:flutter_job_portal/ui/screens/appliedjob.dart';
import 'package:flutter_job_portal/ui/screens/screens.dart';
import 'package:flutter_job_portal/ui/widgets/jobTypesDropDown.dart';
import 'package:flutter_job_portal/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../global.dart';

class JobListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF263238),
        body: Stack(
          children: <Widget>[
          Positioned(
          top: 0,
          right: 0,
          left: 0,
          bottom: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 7.0,
                ),
                Row(
                  children: <Widget>[
                    Text("Applied Jobs", textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20 , color: Color(0xFFFFFFFF)),),
                    Spacer(),

                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(PROFILE);
                        },
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://avatars3.githubusercontent.com/u/30575233?s=460&u=41556de34699d54f689cdd5b20da31f860bd744e&v=4"),
                        ))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 51,
                  child: Row(
                    children: <Widget>[
                  Container(
                  decoration: BoxDecoration(color: Color(0xffe6e6ec),
                  borderRadius: BorderRadius.circular(8.0),

                ),

                    child: new Row(
                      children: <Widget>[
                        Text(" Job Type : " ,style: TextStyle(fontSize: 16),),
                          JobTypesDropDown(),
                      ],
                    )

                  )
//
//                          Text("Job Type : " ,style: TextStyle(fontSize: 16,backgroundColor: Color(0xFFFFFFFF)),),
//                          JobTypesDropDown(),
//
//                          SizedBox(width: 15),
              ],
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Expanded(
              child: new StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection("appliedJobs")
                      .snapshots(),
                  builder: (context, snapshot) {
                    return new ListView.builder(
                        itemCount:snapshot.data.documents.length,
                        itemBuilder: (ctx, i) {
                          return JobContainer(
                            description: snapshot.data.documents[i]
                            ['description'],
                            iconUrl: snapshot.data.documents[i]
                            ['iconUrl'],
                            location: snapshot.data.documents[i]
                            ['location'],
                            salary: snapshot.data.documents[i]
                            ['salary'],
                            title: snapshot.data.documents[i]
                            ['title'],
                            onTap: () =>
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) =>
                                        ApplyJobView(snapshot.data.documents[i]),
                                  ),
                                ),
                          );
                        });
                  }))
          ],
        ),
      ),
    ),
    Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    height: 60,
    child: MyBottomNavBar(pId: 3,),
    ),
    Provider.of<MyBottomSheetModel>(context).visible
    ? Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    // height: MediaQuery.of(context).size.height / 1.3,
    child: MyBottomSheet(),
    )
        : Container(),
    ],
    ),
    ),
    );
  }
AppliedJobsScreen ApplyJobView(DocumentSnapshot snapshot){
    AppliedJobModel appliedJob = new AppliedJobModel(
      id: snapshot["id"],
      userId: snapshot["userId"],
      title: snapshot["title"],
      salary: snapshot["salary"],
      location: snapshot["location"],
      iconUrl: snapshot["iconUrl"],
      description: snapshot["description"],
      appliedDate: snapshot["appliedDate"]

    );

    return AppliedJobsScreen(appliedJob: appliedJob);
}
}