import 'package:flutter/material.dart';
import 'time_page.dart'; // Ensure this file exists

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Booking Platform',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple, // This seed color will not be visible as we are overriding the AppBar color
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1B236D), // Use a color from the gradient
          elevation: 0, // Remove the shadow
          foregroundColor: Colors.white, // Text color on the AppBar
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _boardingController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  int _numberOfPassengers = 1;
  DateTime _selectedDate = DateTime.now();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Add navigation logic based on the index here, if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft, // Start from the left side
            end: Alignment.centerRight,  // End at the right side
            colors: [
              Color(0xFF00062B), // Dark blue
              Color(0xFF1B236D), // Blue
              Color(0xFFC06344), // Orange
              Color(0xFFFBB444), // Yellow-orange
            ],
            stops: [0.1, 0.4, 0.7, 1.0], // Adjust stops for a more dispersed transition
          ),
        ),
        child: Column(
          children: [
            // Header with Title
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80.0),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Uncomment and add the image widget if needed
                  // Image.asset(
                  //   'assets/basketball.png', // Replace with your image path
                  //   width: 50, // Adjust the width as needed
                  //   height: 50, // Adjust the height as needed
                  // ),
                  const SizedBox(width: 8),
                  const Text.rich(
                    TextSpan(
                      text: 'Explore the\n',
                      style: TextStyle(
                        fontFamily: 'Bai Jamjuree', // Apply the Bai Jamjuree font family
                        fontSize: 16,               // Set the font size to 16px
                        fontWeight: FontWeight.w500, // Set font weight to 500
                        height: 1.25,               // Set line height to 20px equivalent
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: 'Cambus',
                          style: TextStyle(
                            fontFamily: 'ASTRO',     // Apply the ASTRO font family
                            fontSize: 24,             // Set the font size to 24px
                            fontWeight: FontWeight.w400, // Set font weight to 400
                            height: 1.4,              // Set line height to 84px equivalent
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left, // Align text to the left
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  margin: const EdgeInsets.only(top:70),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Boarding Point
                      _buildDetailBox(
                        label: 'From',
                        icon: Icons.directions_bus,
                        controller: _boardingController,
                        hint: 'Boarding Point',
                      ),
                      const SizedBox(height: 16),
                      // Destination Point
                      _buildDetailBox(
                        label: 'To',
                        icon: Icons.place,
                        controller: _destinationController,
                        hint: 'Destination Point',
                      ),
                      const SizedBox(height: 8),
                      // Shuffle Button
                      ElevatedButton.icon(
                        onPressed: _shuffleCities,
                        icon: const Icon(Icons.swap_vert, color: Colors.white),
                        label: const Text(
                          '',
                          style: TextStyle(fontSize: 14),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black54,
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Number of Passengers and Date of Travel
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.orange),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.person, size: 20, color: Colors.deepPurple),
                                const SizedBox(width: 8, height: 55,),
                                GestureDetector(
                                  onTap: () {
                                    if (_numberOfPassengers > 1) {
                                      setState(() {
                                        _numberOfPassengers--;
                                      });
                                    }
                                  },
                                  child: const Text(
                                    '<',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ),
                                Text(
                                  ' $_numberOfPassengers Person',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _numberOfPassengers++;
                                    });
                                  },
                                  child: const Text(
                                    '>',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              controller: _dateController,
                              decoration: const InputDecoration(
                                labelText: 'Date of Travel',
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              readOnly: true,
                              onTap: _selectDate,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 300, // Set the desired width
                        child: ElevatedButton(
                          onPressed: () {
                            String boarding = _boardingController.text;
                            String destination = _destinationController.text;
                            String date = _dateController.text;

                            if (boarding.isNotEmpty &&
                                destination.isNotEmpty &&
                                date.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TimePage(
                                    boarding: boarding,
                                    destination: destination,
                                    date: date,
                                    numberOfPassengers: _numberOfPassengers,
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill in all the details.'),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            backgroundColor: Colors.orange, // Set the button color to orange
                          ),
                          child: const Text(
                            'Select Time',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      const SizedBox(height: 38), // Added space at the bottom
                    ],
                  ),
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
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = _formatDate(pickedDate);
      });
    }
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  void _shuffleCities() {
    final String temp = _boardingController.text;
    setState(() {
      _boardingController.text = _destinationController.text;
      _destinationController.text = temp;
    });
  }

  Widget _buildDetailBox({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    required String hint,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepPurple),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
