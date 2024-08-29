import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cambus_project/ticket_page.dart';

import 'line.dart'; // Import the Line widget

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width / 2, size.height);

    final Path dashPath = Path();
    final double dashWidth = 5;
    final double dashSpace = 5;
    double startX = 0;

    while (startX < size.height) {
      dashPath.addRect(Rect.fromLTWH(size.width / 2 - 1, startX, 2, dashWidth));
      startX += dashWidth + dashSpace;
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
class TimePage extends StatefulWidget {
  final String boarding;
  final String destination;
  final String date;
  final int numberOfPassengers;

  const TimePage({
    Key? key,
    required this.boarding,
    required this.destination,
    required this.date,
    required this.numberOfPassengers,
  }) : super(key: key);

  @override
  _TimePageState createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  int _selectedIndex = 0;
  String? _selectedTime;

  final List<String> _busTimes = [
    '03:30 PM',
    '06:00 PM',
    '08:00 AM',
    '10:00 AM'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
          break;
        case 1:
        // Navigate to Location Page
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TicketScreen(
                time: _selectedTime ?? "Not Set",
                date: widget.date,
                startLocation: widget.boarding,
                endLocation: widget.destination,
                passengers: widget.numberOfPassengers.toString(), // Convert to String
                ticketNumber: 'TICKET123',
              ),
            ),
          );
          break;
        case 3:
        // Navigate to Profile Page
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(widget.date);
    String formattedDate = DateFormat('dd MMMM, yyyy').format(dateTime);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF00062B),
              Color(0xFF1B236D),
              Color(0xFFC06344),
              Color(0xFFFBB444),
            ],
            stops: [0.1, 0.4, 0.7, 1.0],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Station details
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.orange),
                          SizedBox(width: 8),
                          Text(
                            widget.boarding,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Bai Jamjuree',
                              height: 1.25,
                            ),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Dotted line
                    CustomPaint(
                      size: Size(double.infinity, 100),
                      painter: DottedLinePainter(),
                    ),

                    const SizedBox(height: 20),

                    // Destination details
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.orange),
                              SizedBox(width: 8),
                              Text(
                                widget.destination,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontFamily: 'Bai Jamjuree',
                                  height: 1.25,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.orange,
                                size: 14,
                              ),
                              SizedBox(width: 8, height: 10),
                              Text(
                                formattedDate,
                                style:
                                TextStyle(fontSize: 12, color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: GridView.builder(
                                  padding: const EdgeInsets.only(top: 60),
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 2.0,
                                  ),
                                  itemCount: _busTimes.length,
                                  itemBuilder: (context, index) {
                                    final time = _busTimes[index];
                                    final isSelected = _selectedTime == time;

                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedTime = time;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? Colors.deepPurple
                                              : Colors.white,
                                          border: Border.all(
                                              color: Colors.orange),
                                          borderRadius:
                                          BorderRadius.circular(8),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          time,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.deepPurple,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: 293,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: _selectedTime != null
                                      ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TicketScreen(
                                          time: _selectedTime!,
                                          date: widget.date,
                                          startLocation: widget.boarding,
                                          endLocation: widget.destination,
                                          passengers: widget.numberOfPassengers.toString(), // Convert int to String
                                          ticketNumber: 'TICKET123',
                                        ),
                                      ),
                                    );
                                  }
                                      : null,
                                  child: const Text(
                                    'Proceed to Payment',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.orange,
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Location',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_num),
              label: 'Ticket',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: const Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}

