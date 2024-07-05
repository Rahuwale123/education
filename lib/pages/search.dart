import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:login/data/courses.dart';
import 'package:login/pages/explore.dart';
import 'package:login/pages/videoplay.dart';

class Course {
  final String id;
  final String name;


  Course({ required this.id, required this.name});

  static List<Course> courses = [
    Course( id: 'python', name: 'Python'),
    Course(id: 'html', name: 'HTML'),
    Course( id: 'react', name: 'React'),
    Course( id: 'css', name: 'CSS'),
    Course( id: 'js', name: 'JavaScript'),
    Course( id: 'node', name: 'Node'),
    Course( id: 'angular', name: 'Angular'),
    Course( id: 'java', name: 'Java'),
    Course( id: 'ai', name: 'AI'),
    Course( id: 'ml', name: 'ML'),
    Course( id: 'ruby', name: 'Ruby'),
    Course( id: 'rust', name: 'Rust'),
  ];
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Courses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TypeAheadField<Course>(
          suggestionsCallback: (pattern) async {
            return Course.courses
                .where((course) => course.name.toLowerCase().contains(pattern.toLowerCase()))
                .toList();
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(suggestion.name),
            );
          }, onSelected: (Course value) { 
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Explore(show: value.id),
              ),
            );
           },
          
          
          
        ),
      ),
    );
  }
}
