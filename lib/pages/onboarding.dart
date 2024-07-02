import 'package:flutter/material.dart';
import 'package:login/pages/home.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  bool issel = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
              },
              child: Text("Skip"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Discover new Courses",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "Select your intrest",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 25,
                  ),
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
                            label: Text(intrest[index][0].toString()),
                            selected: intrest[index][1],
                            selectedColor: Colors.green,
                            onSelected: (value) {
                              setState(() {
                                intrest[index][1] = value;
                                intrest.forEach(
                                  (element) {
                                    if (element[1] == true) {
                                      issel = true;
                                    }
                                  },
                                );
                              });
                            },
                          );
                        },
                        itemCount: intrest.length,
                        shrinkWrap: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Container(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            issel ? Colors.green : Colors.grey.shade400),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
