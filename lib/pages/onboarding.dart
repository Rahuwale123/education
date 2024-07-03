import 'package:flutter/material.dart';
import 'package:login/pages/home.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  bool isSelected = false;
  String? selectedInterest;
  List interests = [
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

  void _showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        'You can select only one option',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

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
                  builder: (context) => Home(show: '',),
                ),
              );
            },
            child: Text("Skip"),
          )
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
                    "Select your interest",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                        itemBuilder: (context, index) {
                          return ChoiceChip(
                            label: Text(interests[index][0].toString()),
                            selected: interests[index][1],
                            selectedColor: Colors.green,
                            onSelected: (value) {
                              setState(() {
                                if (!isSelected || interests[index][1]) {
                                  interests[index][1] = value;
                                  isSelected = value;
                                  selectedInterest = value ? interests[index][0] : null;
                                } else {
                                  _showSnackbar(context);
                                }
                              });
                            },
                          );
                        },
                        itemCount: interests.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Container(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      isSelected ? Colors.green : Colors.grey.shade400,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (isSelected) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(show: selectedInterest.toString()),
                        ),
                      );
                    } else {
                      _showSnackbar(context);
                    }
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
