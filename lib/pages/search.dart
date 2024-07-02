import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List intrest = [
    ["html", false],
    ["React", false],
    ["Python", false],
    ["Css", false],
    ["js", false],
    ["node", false],
    ["Angular", false],
    ["java", false],
    ["AI", false],
    ["Ml", false],
    ["Ruby", false],
    ["Rust", false],
  ];
  List top = [

    ["Angular", false],
    ["java", false],
    ["AI", false],
    ["Ml", false],
    ["Ruby", false],
    ["Rust", false],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30,
                      )),
                  Container(
                    height: 40,
                    width: 250,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search Courses',
                          border: OutlineInputBorder()),
                    ),
                  )
                ],
              ),
            ),
            Text(
              "Course history",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 200,
                width: double.infinity,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return ChoiceChip(
                      label: Text(intrest[index][0].toString()),
                      selected: intrest[index][1],
                      selectedColor: Colors.green,
                      onSelected: (value) {
                        setState(() {
                          intrest[index][1] = value;
                        });
                      },
                    );
                  },
                  itemCount: 6,
                  shrinkWrap: false,
                ),
              ),
            ),
            Text("Trending Courses",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w900),),
             Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        itemBuilder: (context, index) {
                          return ChoiceChip(
                            label: Text(top[index][0].toString()),
                            selected: top[index][1],
                            selectedColor: Colors.green,
                            onSelected: (value) {
                              setState(() {
                                top[index][1] = value;
                                
                              });
                            },
                          );
                        },
                        itemCount:5,
                        shrinkWrap: false,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
