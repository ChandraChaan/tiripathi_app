import 'package:flutter/material.dart';

import 'package:tirumala_app/model/stories_model.dart';
import 'package:tirumala_app/stories/stories.dart';

class Storyview extends StatefulWidget {

final Welcome sroty_v;

  Storyview(this.sroty_v);

  @override
  _StoryviewState createState() => _StoryviewState(this.sroty_v);
}

class _StoryviewState extends State<Storyview> {
  _StoryviewState(Welcome sroty_v);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.sroty_v.title),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
              child: Column(
          children: [
            Text(widget.sroty_v.title),
            Text(widget.sroty_v.subTitle),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height/3,
                                decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage("https://cc.unitedoriginals.in/uploads/image/" + widget.sroty_v.image),
                                  ),
                                ),
                              ),
            ),
                  Text(widget.sroty_v.comment),
          ],
        ),
      ),
    );
  }
}