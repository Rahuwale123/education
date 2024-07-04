import 'package:flutter/material.dart';
import 'package:login/data/courses.dart';
import 'package:login/pages/videoplay.dart';

import 'explore.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<dynamic> allCourses = [
    ...python,
    ...html,
    ...react,
    ...css,
    ...js,
    ...node,
    ...angular,
    ...java,
    ...ai,
    ...ml,
    ...ruby,
    ...rust,
  ];

  List<dynamic> filteredCourses = [];

  @override
  void initState() {
    filteredCourses = allCourses;
    super.initState();
  }

  void filterCourses(String query) {
    setState(() {
      filteredCourses = allCourses
          .where((course) =>
              course[2].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Courses'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                filterCourses(value);
              },
              decoration: InputDecoration(
                hintText: 'Search Courses',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCourses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredCourses[index][2]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YoutubePlayerScreen(
                         id:filteredCourses[index][0], userInterest: '', 
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
