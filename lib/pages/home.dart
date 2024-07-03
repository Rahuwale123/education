import 'package:flutter/material.dart';
import 'package:login/data/courses.dart';
import 'package:login/pages/videoplay.dart';
import 'search.dart';
class Home extends StatefulWidget {
  final String show;
  const Home({Key? key, required this.show}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  List<dynamic> filteredCourses =[];
  @override
  void initState() {
    super.initState();
    filterCourses();
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
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Search(),
                ),
              );
            },
            icon: Icon(Icons.search, size: 30),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Discover Courses and ",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "resources",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueGrey[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Explore",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Search Courses",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => YoutubePlayerScreen(
                                      id: filteredCourses[index][0], userInterest: widget.show,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: MediaQuery.of(context).size.height * 0.25,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      filteredCourses[index][1].toString(),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              filteredCourses[index][2],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: filteredCourses.length,
                ),
              ),
              SizedBox(height: 10),
              Divider(),
              Text(
                "Featured Courses",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => YoutubePlayerScreen(id: 'mEsleV16qdo', userInterest: widget.show,),
                    ),
                  );
                },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage("assets/images/genai.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Learn Gen-AI",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              Text(
                "Weekly Courses",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => YoutubePlayerScreen(
                                      id: filteredCourses[index + 3][0], userInterest: widget.show,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: MediaQuery.of(context).size.height * 0.25,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      filteredCourses[index + 3][1].toString(),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              filteredCourses[index + 3][2],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 3,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Top Picks",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YoutubePlayerScreen(
                                  id: 'MqffbpjhriQ', userInterest: widget.show
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 170,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/ai2.jpg"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        Text(
                          "AI",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "4-Weeks",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YoutubePlayerScreen(
                                  id: 'hL2KJkIUVZA', userInterest: widget.show
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 170,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/ai.jpg"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        Text(
                          "Flutter",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "3-Weeks",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YoutubePlayerScreen(
                                  id: '9RXFYxH4VTg', userInterest: widget.show
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 170,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/ai.jpg"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        Text(
                          "Generative AI",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "5-Weeks",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
