import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tirumala_app/model/stories_model.dart';
import 'package:http/http.dart' as http;

import 'view_story.dart';

class stories_tirumala extends StatefulWidget {
  @override
  _stories_tirumalaState createState() => _stories_tirumalaState();
}

class _stories_tirumalaState extends State<stories_tirumala> {
  List<stories> storys = [
    stories(id:1,title: 'yes', sub_title: 'ok', ),
  ];
  List storyJson;

  var url = Uri.parse('https://cc.unitedoriginals.in/api_post/posts');

  Future<List<Welcome>> getData() async {
    print('just entered to hit URL');
    var res = await http.get(url);
    // print(res.body);
    if (res.statusCode == 200) {
      print('getteing status code 200');
        return welcomeFromMap(res.body);
      // for (var i = 0; i < storyJson.length; i++) {
      //   print('for loop running');
      //   print(storyJson[i].id);
      //   setState(() {
      //     storys.add(
      //         stories(
      //           id:storyJson[i].id as int,
      //           title:storyJson[i].title as String,
      //           sub_title:storyJson[i].sub_title as String,
      //           image:storyJson[i].image as String,
      //           comment:storyJson[i].comment as String,
      //         )
      //     );
      //   });
      //
      // }
    } else {
      print('there is error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('state runing');

    getData();
  }

  @override
  Widget build(BuildContext context) {
    print('build running');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UNITED ORIGINALS',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Welcome posts = snapshot.data[index];
                    return Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://cc.unitedoriginals.in/uploads/image/" +
                                      posts.image),
                            ),
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 28),
                                child: FlatButton(
                                  color: Colors.green,
                                  child: Text(
                                    'See More....',
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Storyview(snapshot.data[index])),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]);
                  });
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),

    );
  }
}


// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);


List<Welcome> welcomeFromMap(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromMap(x)));

String welcomeToMap(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Welcome {
  Welcome({
    this.id,
    this.title,
    this.subTitle,
    this.comment,
    this.image,
  });

  String id;
  String title;
  String subTitle;
  String comment;
  String image;

  factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
    id: json["id"],
    title: json["title"],
    subTitle: json["sub_title"],
    comment: json["comment"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "sub_title": subTitle,
    "comment": comment,
    "image": image,
  };
}