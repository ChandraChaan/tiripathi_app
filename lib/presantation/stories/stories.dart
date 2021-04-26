import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tirumala_app/application/http_service.dart';
import 'package:tirumala_app/domain/stories_model.dart';
import 'package:tirumala_app/presantation/stories/view_story.dart';
// import 'package:tirumala_app/application/http_service.dart';

class stories_tirumala extends StatefulWidget {

  final HttpService httpService = HttpService();

  @override
  _stories_tirumalaState createState() => _stories_tirumalaState();
}

class _stories_tirumalaState extends State<stories_tirumala> {
    @override
    Widget build(BuildContext context) {
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
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: FutureBuilder<List<Stories>>(
            future: widget.httpService.getData(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Stories>> snapshot) {
              List<Stories> stories_list = snapshot.data;
              // print(stories_list);
              if (snapshot.hasData) {
                List<Stories> stories_list = snapshot.data;
                return ListView.builder(
                    itemCount: stories_list.length,
                    itemBuilder: (BuildContext context, int index) {
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
                                        stories_list[index].image),
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
                                                Storyview(sroty_v: stories_list[index])),
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

