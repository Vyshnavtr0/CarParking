import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final List<String> items = ['1st Floor', '2nd Floor', '3rd Floor'];
  String selectedValue = '1st Floor';
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    items: items.map<DropdownMenuItem<String>>((String value) {
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
                Row(
                  children: [
                    ListView.builder(itemBuilder: (contxt, index) {
                      return Container(
                        width: 100,
                        height: 80,
                        decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(30),
                          border: Border(
                            top: BorderSide(
                                width: 2.0, color: Colors.grey), // Top border
                            left: BorderSide(
                                width: 2.0, color: Colors.grey), // Left border
                            bottom: BorderSide(
                                width: 2.0, color: Colors.grey), // Right border
                          ),
                        ),
                        child: Column(
                          children: [
                            Image.network('src'),
                            Text(
                              '1 -A',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
