import 'package:carparking/Screens/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPageIndex = 0;
  int selecttras = 0;
  late GoogleMapController _googleMapController;
  Marker? _origin = null;
  Marker? _destination = null;
  //Directions? _info;
  BitmapDescriptor markericon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markericonhome = BitmapDescriptor.defaultMarker;
  List<String> names = [
    "City Center Parking Garage",
    "Sunset View Parking Lot",
    "Green Park Car Park",
    "Downtown Plaza Parking",
    "Riverfront Parking Deck",
    "Maple Street Parking",
    "Ocean View Parking Facility",
    "Park & Ride Lot",
    "Airport Parking Terminal",
    "Sports Arena Parking Zone",
  ];
  List<String> images = [
    "https://res.cloudinary.com/dbsojp5dm/image/upload/v1695804192/car6_r31c1h.jpg",
    "https://res.cloudinary.com/dbsojp5dm/image/upload/v1695804192/car1_mele5o.jpg",
    "https://res.cloudinary.com/dbsojp5dm/image/upload/v1695804192/car4_wn7z1q.jpg",
    "https://res.cloudinary.com/dbsojp5dm/image/upload/v1695804192/car5_sfpous.jpg",
    "https://res.cloudinary.com/dbsojp5dm/image/upload/v1695804192/car3_o7ryuk.jpg",
    "https://res.cloudinary.com/dbsojp5dm/image/upload/v1695804192/car3_o7ryuk.jpg"
  ];
  List<String> v = ["Car", "Bicycle", "MotorBike"];
  PageController _pageController = PageController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _googleMapController.dispose();
  }

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
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceInOut);
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
          child: PageView(
        controller: _pageController,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              child: ListView(physics: BouncingScrollPhysics(), children: [
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Transportation Type",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: const Text(
                      //     "See More",
                      //     style: TextStyle(
                      //         color: Color(0xff5d5fef),
                      //         fontSize: 12,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // )
                    ],
                  ),
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
                                style: TextStyle(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Nearby Spots",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Color(0xff1e1e1e),
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    images[index],
                                    height:
                                        MediaQuery.of(context).size.width / 4,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        names[index],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "2km",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Icon(
                                                    Icons.ev_station_outlined,
                                                    color: Colors.white,
                                                  ),
                                                  Icon(
                                                    Icons.accessible,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              "Price",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ]),
            ),
          ),
          SizedBox(
            // height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                GoogleMap(
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                      new Factory<OneSequenceGestureRecognizer>(
                        () => new EagerGestureRecognizer(),
                      ),
                    ].toSet(),
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                    onMapCreated: (controller) {
                      _googleMapController = controller;
                      //_googleMapController.setMapStyle(maptheme);
                    },
                    initialCameraPosition: CameraPosition(
                        target: LatLng(37.42796133580664, -122.085749655962),
                        zoom: 14)),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Maintain 30 /km per hour \n to avoid signal congestion",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Center(
              child: Text(
                "Profile screen",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      )),
    );
  }
}
