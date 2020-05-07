import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job_portal/constants/constants.dart';
import 'package:flutter_job_portal/models/bottomsheet.dart';
import 'package:flutter_job_portal/ui/screens/screens.dart';
import 'package:flutter_job_portal/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff0f0f6),
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
                        MyDropDownButton(),
                        Spacer(),
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black87,
                          ),
                          onPressed: () {},
                        ),
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
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: "Search",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide.none),
                                fillColor: Color(0xffe6e6ec),
                                filled: true,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffe6e6ec),
                              borderRadius: BorderRadius.circular(9.0),
                            ),
                            child: IconButton(
                              icon: Icon(Icons.tune),
                              onPressed: () {
                                Provider.of<MyBottomSheetModel>(context)
                                    .changeState();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Expanded(
                        child: new StreamBuilder<QuerySnapshot>(
                            stream: Firestore.instance
                                .collection("jobs")
                                .snapshots(),
                            builder: (context, snapshot) {
                              return new ListView.builder(
                                  itemCount: snapshot.data.documents.length,
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
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (ctx) =>
                                              DetailsScreen(id: i),
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
              child: MyBottomNavBar(pId:0),
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
}
