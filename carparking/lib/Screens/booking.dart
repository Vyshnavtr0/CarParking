import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final List<String> items = ['1st Floor', '2nd Floor', '3rd Floor'];
  final List<String> names = [
    '1-A',
    '2-A',
    '3-A',
    '4-A',
  ];
  final List<String> names2 = ['5-A', '6-A', '7-A', '8-A'];
  String selectedValue = '1st Floor';
  int _select = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Choose Parking Slot",
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              CupertinoIcons.back,
              color: Colors.white,
              size: 30,
            ),
          )),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "City Center Parking Garage",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Paris,France",
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: DropdownButton<String>(
                        value: selectedValue,
                        dropdownColor: Colors.black,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          }
                        },
                        items:
                            items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        style: TextStyle(color: Colors.white), // Text color
                        underline: SizedBox(), // Removes the default underline
                        icon: Icon(Icons.arrow_drop_down), // Dropdown icon
                        isExpanded:
                            true, // Makes the dropdown button expand to fit the width
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff1e1e1e),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "5 slots available",
                          style: TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: names.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 100,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            //borderRadius: BorderRadius.circular(30),
                                            border: Border(
                                              top: BorderSide(
                                                  width: 2.0,
                                                  color: Colors
                                                      .grey), // Top border
                                              left: BorderSide(
                                                  width: 2.0,
                                                  color: Colors
                                                      .grey), // Left border
                                              bottom: BorderSide(
                                                  width: 2.0,
                                                  color: Colors
                                                      .grey), // Right border
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Transform.rotate(
                                                angle:
                                                    90 * (3.14159265359 / 180),
                                                child: Image.asset(
                                                  'assets/images/car.png',
                                                  height: 50,
                                                  width: 70,
                                                ),
                                              ),
                                              Text(
                                                names[index],
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          width: 130,
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: names2.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _select = index;
                                        });
                                        print(_select);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 100,
                                          height: 80,
                                          decoration: BoxDecoration(
                                            //borderRadius: BorderRadius.circular(30),
                                            border: Border(
                                              top: BorderSide(
                                                  width: 2.0,
                                                  color: _select == index &&
                                                          (index == 1 ||
                                                              index == 3)
                                                      ? Color(0xff5d5fef)
                                                      : Colors
                                                          .grey), // Top border
                                              right: BorderSide(
                                                  width: 2.0,
                                                  color: _select == index &&
                                                          (index == 1 ||
                                                              index == 3)
                                                      ? Color(0xff5d5fef)
                                                      : Colors
                                                          .grey), // Left border
                                              bottom: BorderSide(
                                                  width: 2.0,
                                                  color: _select == index &&
                                                          (index == 1 ||
                                                              index == 3)
                                                      ? Color(0xff5d5fef)
                                                      : Colors
                                                          .grey), // Right border
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Visibility(
                                                visible:
                                                    index == 3 || index == 1
                                                        ? false
                                                        : true,
                                                child: Transform.rotate(
                                                  angle: -90 *
                                                      (3.14159265359 / 180),
                                                  child: Image.asset(
                                                    'assets/images/car.png',
                                                    height: 50,
                                                    width: 70,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                names2[index],
                                                style: TextStyle(
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    color: Color(0xff1e1e1e),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Price :\n25 rs/ per hour",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.3,
                        decoration: BoxDecoration(
                            color: Color(0xff5d5fef),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Book Parking',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
