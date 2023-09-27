import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPageIndex = 0;
  int selecttras = 0;
  List<String> v = ["Car", "Bicycle", "MotorBike"];
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
          duration: const Duration(milliseconds: 100), // tab animation duration
          gap: 3, // the tab button gap between icon and text
          color: Colors.white, // unselected icon color
          activeColor: const Color(0xff5d5fef),
          textSize: 12, // selected icon and text color
          iconSize: 24,
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 5), // navigation bar padding
          tabs: const [
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
                const Text(
                  "Parking \nMade easy.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color(0xff1e1e1e),
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextField(
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      onChanged: (value) {
                        // Update the search text when the user types
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        prefixIcon: Container(
                          decoration: const BoxDecoration(),
                          child: const Icon(
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
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Transportation Type",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
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
                  height: MediaQuery.of(context).size.width / 2.8,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selecttras = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: selecttras == index
                                  ? [
                                      const Color(0xff1e1e1e),
                                      const Color(0xff22233f),
                                      const Color(0xff24254e),
                                      const Color(0xff272860),
                                      const Color(0xff292a6d),
                                      const Color(0xff292a73),
                                    ]
                                  : [
                                      const Color(0xff1e1e1e),
                                      const Color(0xff1e1e1e)
                                    ],
                            ),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: selecttras == index
                                  ? const Color(0xff5d5fef)
                                  : Colors.transparent, // Border color
                              width: 2.0, // Border width
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                  "assets/images/${v[index].toString()}.svg",
                                  color: Colors.white,
                                  width: MediaQuery.of(context).size.width / 12,
                                  height:
                                      MediaQuery.of(context).size.width / 12,
                                  semanticsLabel: ''),
                              Text(
                                v[index],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          decoration:
                              const BoxDecoration(color: Color(0xff1e1e1e)),
                          child: const Row(),
                        );
                      }),
                )
              ]),
            )
          ],
        ),
      )),
    );
  }
}
