import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: GNav(
          style: GnavStyle.oldSchool,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          onTabChange: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          rippleColor:
              Colors.grey.shade800, // tab button ripple color when pressed
          hoverColor: Colors.grey.shade700, // tab button hover color
          backgroundColor: Colors.black,
          curve: Curves.ease, // tab animation curves
          duration: Duration(milliseconds: 100), // tab animation duration
          gap: 3, // the tab button gap between icon and text
          color: Colors.white, // unselected icon color
          activeColor: Color(0xff5d5fef),
          textSize: 12, // selected icon and text color
          iconSize: 24,
          padding: EdgeInsets.symmetric(
              horizontal: 10, vertical: 5), // navigation bar padding
          tabs: [
            GButton(
                icon: Icons.home_max_outlined,
                text: 'Home',
                textStyle: TextStyle(fontSize: 10)),
            GButton(
                icon: CupertinoIcons.location,
                text: 'Navigation',
                textStyle: TextStyle(fontSize: 10)),
            GButton(
                icon: Icons.person_2_outlined,
                text: 'Profile',
                textStyle: TextStyle(fontSize: 10))
          ]),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: PageView(
          children: [
            SizedBox(
              child: ListView(children: [
                Text(
                  "Parking \nMade easy.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xff1e1e1e),
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      onChanged: (value) {
                        // Update the search text when the user types
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        prefixIcon: Container(
                          decoration: BoxDecoration(),
                          child: Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: 'Search for parking....',
                        hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transportation Type",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See More",
                        style: TextStyle(
                            color: Color(0xff5d5fef),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 2.5,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Color(0xff5d5fef), // Border color
                            width: 2.0, // Border width
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.car_crash,
                              color: Colors.white,
                            ),
                            Text(
                              "Car",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      )),
    );
  }
}
