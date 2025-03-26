import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Maya Ramon,\nGood Morning 🌞',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:Colors.grey ),
                  ),
                  Icon(Icons.notifications_none, size: 30, color: Colors.black45),
                ],
              ),
              SizedBox(height: 20),

              // Sleep Info Box
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // First Container (Purple - Partially Visible at the Top)
                  Positioned(
                    top: 8, // Slightly visible
                    left: 40, // Positioned centrally
                    child: Container(
                      width: 250, // Smaller width
                      height: 50, // Smaller height
                      decoration: BoxDecoration(
                        color: Colors.purple[200],
                        border: Border.all(color: Colors.white54, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  // "X" Icon for First Container (Purple)
                  Positioned(
                    top: 5, // Adjusted for correct positioning
                    right: 30,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        print('Close button clicked (Purple Container)');
                      },
                    ),
                  ),

                  // Second Container (Green - Main One)
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 30), // Positioned below purple
                    child: Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.green[200],
                        border: Border.all(color: Colors.white54, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  // "X" Icon for Second Container (Green)
                  Positioned(
                    top: 20, // Corrected position near green container
                    right: 10,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        print('Close button clicked (Green Container)');
                      },
                    ),
                  ),

                  // Text inside the second container
                  Positioned(
                    top: 70,
                    left: 50,
                    child: Text(
                      'You have Slept 09:30 that is \n \n above your recommendation ',
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Sleep Calendar Title
              Text(
                'Your Sleep Calendar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),

              // Sleep Calendar
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DayCard(day: "Tue", date: 22),
                    DayCard(day: "Wed", date: 23),
                    DayCard(day: "Thu", date: 24),
                    DayCard(day: "Fri", date: 25),
                    DayCard(day: "Sat", date: 26),
                    DayCard(day: "Sun", date: 27),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Sleep Details (Bedtime & Alarm)
              Row(
                children: [
                  Expanded(
                    child: SleepDetailCard(
                      title: "Bed time",
                      time: "7H 28Min",
                      mainIcon: Icons.bed,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: SleepDetailCard(
                      title: "Alarm",
                      time: "16H 18Min",
                      mainIcon: Icons.alarm,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Stack(
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6, // 60% of screen width
                      height: MediaQuery.of(context).size.height * 0.25, // 25% of screen height
                      decoration: BoxDecoration(
                        color: Colors.purple[50], // Container color
                        borderRadius: BorderRadius.circular(20), // Border radius
                      ),
                    ),
                  ),

                  // Text "Have a problem"
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.20, // 30% of screen width
                    top: MediaQuery.of(context).size.height * 0.05, // 10% of screen height
                    child: Text(
                      "Have a problem",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Text "Sleeping?"
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.20, // 30% of screen width
                    top: MediaQuery.of(context).size.height * 0.09, // 15% of screen height
                    child: Text(
                      "Sleeping?",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Button Container
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.20, // 28% of screen width
                    top: MediaQuery.of(context).size.height * 0.16, // 25% of screen height
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.purple[100], // Container color
                        borderRadius: BorderRadius.circular(20), // Border radius
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Consult Expert",
                        style: TextStyle(
                          color: Colors.purple[800], // Text color
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Image (Positioned Responsively)
                  Positioned(

                    left: MediaQuery.of(context).size.width * 0.18, // Center horizontally
                    top: MediaQuery.of(context).size.height * 0.005, // 8% of screen height
                    child: Image.asset(
                      'assets/images/Path 6463 1.png',

                      fit: BoxFit.contain, // Ensures the image maintains its aspect ratio
                    ),
                  ),

                ],
              )




            ],
          ),
        ),
      ),
      // Bottom Navigation Bar added here
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "",
          ),
        ],
        backgroundColor: Colors.black,  // Set the background color of the bottom navigation bar
        selectedItemColor: Colors.grey,  // Set the color of the selected item icon to grey
        unselectedItemColor: Colors.grey,  // Set the color of the unselected item icon to grey
        showSelectedLabels: true,  // Optionally show labels when selected
        showUnselectedLabels: true,  // Optionally show labels when unselected
      ),


    );
  }
}

// Day Card Widget
class DayCard extends StatefulWidget {
  final String day;
  final int date;

  const DayCard({required this.day, required this.date});

  @override
  _DayCardState createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  bool isSelected = false; // Track selection state

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected; // Toggle selection
        });
      },
      child: Padding(
        padding: EdgeInsets.only(right: 8),
        child: Column(
          children: [
            Text(widget.day, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.grey[200], // Change color when clicked
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Center(
                child: Text(
                  widget.date.toString(),
                  style: TextStyle(fontSize: 16, color: isSelected ? Colors.white : Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SleepDetailCard extends StatefulWidget {
  final String title;
  final String time;
  final IconData mainIcon;

  const SleepDetailCard({
    Key? key,
    required this.title,
    required this.time,
    required this.mainIcon,
  }) : super(key: key);

  @override
  _SleepDetailCardState createState() => _SleepDetailCardState();
}

class _SleepDetailCardState extends State<SleepDetailCard> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white54),
        borderRadius: BorderRadius.circular(10),
        color: Colors.purple[50], // Set the color to PurpleAccent[200]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Row to hold the vertical three dots (ellipsis)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.more_vert), // Vertical three dots icon
                onPressed: () {
                  print('Three dots clicked');
                },
              ),
            ],
          ),
          SizedBox(height: 8),
          Icon(widget.mainIcon, size: 24),
          SizedBox(height: 8),
          Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(widget.time, style: TextStyle(fontSize: 12)),
          SizedBox(height: 10),
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
