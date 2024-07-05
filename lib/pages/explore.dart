import 'package:flutter/material.dart';
import 'package:login/pages/videoplay.dart';

import '../data/courses.dart';

class Explore extends StatefulWidget {
  final String show;
  const Explore({super.key, required this.show});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List<dynamic> filteredCourses = [];

  @override
  void initState() {
    filterCourses();
    super.initState();
  }

  void filterCourses() {
    setState(() {
      switch (widget.show.toLowerCase()) {
        case 'html':
          filteredCourses = html;
          break;
        case 'react':
          filteredCourses = react;
          break;
        case 'python':
          filteredCourses = python;
          break;
        case 'css':
          filteredCourses = css;
          break;
        case 'js':
          filteredCourses = js;
          break;
        case 'node':
          filteredCourses = node;
          break;
        case 'angular':
          filteredCourses = angular;
          break;
        case 'java':
          filteredCourses = java;
          break;
        case 'ai':
          filteredCourses = ai;
          break;
        case 'ml':
          filteredCourses = ml;
          break;
        case 'ruby':
          filteredCourses = ruby;
          break;
        case 'rust':
          filteredCourses = rust;
          break;
        default:
          filteredCourses = python;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => YoutubePlayerScreen(
                                      id: filteredCourses[index][0],
                                      userInterest: widget.show),
                                ));
                          },
                          child: Container(
                            height: 100,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image:
                                        NetworkImage(filteredCourses[index][1]),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          filteredCourses[index][2].toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                          maxLines: 3,
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: filteredCourses.length,
            )
          ],
        ),
      ),
    );
  }
}
