import 'package:flutter/material.dart';
import 'package:login/pages/videoplay.dart';

import 'search.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Search(),));
            },
            icon: Icon(Icons.search, size: 30),
          )
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
                            Navigator.push(context,MaterialPageRoute(builder: (context) => YoutubePlayerScreen(id: 'ERCMXc8x7mc',),));
                          },
                          child: Container(
                            width: 170,
                            height: 100,
                            decoration: BoxDecoration(
                               image: DecorationImage(image: AssetImage("assets/images/python.jpg"),fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Text(
                          "Python",
                          style:
                              TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "4-Weeks",
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => YoutubePlayerScreen(id: 'y39OlGrVFD8'),));
                          },
                          child: Container(
                            width: 170,
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage("assets/images/ai.jpg"),fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Text(
                          "AI",
                          style:
                              TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "1-Weeks",
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Divider(),
              Text(
                "Featured Courses",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),),
          InkWell(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => YoutubePlayerScreen(id: 'mEsleV16qdo'),));
            },
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                 image: DecorationImage(image: AssetImage("assets/images/genai.jpg"),fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Center(child: Text("Learn Gen-AI",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),)),
          SizedBox(height: 10,),
          Divider(),
              SizedBox(height: 10,)  ,
              Text(
                "Weekly Courses",
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
                            Navigator.push(context,MaterialPageRoute(builder: (context) => YoutubePlayerScreen(id: 'CGLdH5ORX-Y'),));
                          },
                          child: Container(
                            width: 170,
                            height: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage("assets/images/angular.jpg"),fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Text(
                          "Angular",
                          style:
                              TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "4-Weeks",
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => YoutubePlayerScreen(id: 'RGKi6LSPDLU'),));
                          },
                          child: Container(
                            width: 170,
                            height: 100,
                            decoration: BoxDecoration(
                                 image: DecorationImage(image: AssetImage("assets/images/reactjs.jpg"),fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Text(
                          "React",
                          style:
                              TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "1-Weeks",
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
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
                            Navigator.push(context,MaterialPageRoute(builder: (context) => YoutubePlayerScreen(id: 'MqffbpjhriQ'),));
                          },
                          child: Container(
                            width: 170,
                            height: 100,
                            decoration: BoxDecoration(
                               image: DecorationImage(image: AssetImage("assets/images/ai2.jpg"),fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Text(
                          "AI",
                          style:
                              TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "4-Weeks",
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => YoutubePlayerScreen(id: 'i_LwzRVP7bg'),));
                          },
                          child: Container(
                            width: 170,
                            height: 100,
                            decoration: BoxDecoration(
                                 image: DecorationImage(image: AssetImage("assets/images/ml.jpg"),fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Text(
                          "ML",
                          style:
                              TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "1-Weeks",
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),  
            ],
          ),
        ),
      ),
    );
  }
}
