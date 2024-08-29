import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(TicketApp());
}

class TicketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TicketScreen(
        time: "3:00 PM",
        date: "2024-01-22",
        startLocation: "Sadar",
        endLocation: "Institute",
        passengers: "2 Adult",
        ticketNumber: "2201AA",
      ),
    );
  }
}

class TicketScreen extends StatefulWidget {
  final String time;
  final String date;
  final String startLocation;
  final String endLocation;
  final String passengers;
  final String ticketNumber;

  TicketScreen({
    required this.time,
    required this.date,
    required this.startLocation,
    required this.endLocation,
    required this.passengers,
    required this.ticketNumber,
  });

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('d MMMM, yyyy').format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF00062B), // Dark blue
              Color(0xFF1B236D), // Blue
              Color(0xFFC06344), // Orange
              Color(0xFFFBB444), // Yellow-orange
            ],
            stops: [0.1, 0.4, 0.7, 1.0],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xFF748AA1),
                                radius: 24,
                                child: Icon(Icons.person, color: Colors.white, size: 28),
                              ),
                              Text(
                                "22bds038",
                                style: TextStyle(fontSize: 18, color: Colors.black87),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),

                          // Custom Dotted Line
                          DottedLine(dashColor: Colors.grey),

                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                widget.startLocation,
                                style: TextStyle(fontSize: 16, color: Colors.black87),
                              ),
                              Icon(Icons.directions_bus, color: Colors.orange),
                              Text(
                                widget.endLocation,
                                style: TextStyle(fontSize: 16, color: Colors.black87),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF3F4F6),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(Icons.access_time, color: Color(0xFF748AA1)),
                                        SizedBox(height: 4),
                                        Text(
                                          widget.time,
                                          style: TextStyle(color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF3F4F6),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(Icons.calendar_today, color: Color(0xFF748AA1)),
                                        SizedBox(height: 4),
                                        Text(
                                          _formatDate(widget.date),
                                          style: TextStyle(color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Passenger",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    widget.passengers + " Adult",
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Ticket",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    widget.ticketNumber,
                                    style: TextStyle(color: Colors.black87),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Container(
                            width: 100,
                            height: 100,
                            color: Colors.black12,
                            child: Center(
                              child: Text("QR Code"),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Get QR code scanned to enter the bus",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 90),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Download Ticket",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black38, // Change text color when selected
        unselectedItemColor: Colors.black87, // Change text color when unselected
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        onTap: _onItemTapped,
        backgroundColor: Colors.orange, // Set the background color to orange
        type: BottomNavigationBarType.fixed, // Ensures that the background color applies correctly
      ),

    );
  }
}

class DottedLine extends StatelessWidget {
  final double dashWidth;
  final double dashHeight;
  final Color dashColor;

  DottedLine({
    this.dashWidth = 5.0,
    this.dashHeight = 1.0,
    this.dashColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: dashColor),
              ),
            );
          }),
        );
      },
    );
  }
}
