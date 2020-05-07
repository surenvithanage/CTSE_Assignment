import 'package:flutter/material.dart';
import 'package:flutter_job_portal/global.dart';

class AppliedJobsScreen extends StatelessWidget {
  final int id;

  const AppliedJobsScreen({Key key, @required this.id}) : super(key: key);
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
              height: MediaQuery.of(context).size.height/2,
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
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: MediaQuery.of(context).size.height /2,
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
                      Text(
                        "${appliedJobList[id].title}",
                        style: Theme.of(context).textTheme.headline,
                      ),
                      Text(
                        "${appliedJobList[id].location}",
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
                        "${appliedJobList[id].description}",
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
//                      Container(
//                        height: 80,
//                        child: ListView.builder(
//                          scrollDirection: Axis.horizontal,
//                          itemCount: jobList[id].photos.length,
//                          itemBuilder: (ctx, i) {
//                            return Padding(
//                              padding:
//                              const EdgeInsets.symmetric(horizontal: 9.0),
//                              child: ClipRRect(
//                                borderRadius: BorderRadius.circular(15.0),
//                                child:
//                                Image.network("${appliedJobList[id].photos[i]}"),
//                              ),
//                            );
//                          },
//                        ),
//                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.height * .7,
                        height: 45,
                        child: Text("Applied On : 05/06/2020",textDirection: TextDirection.ltr)
                      )
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
}
