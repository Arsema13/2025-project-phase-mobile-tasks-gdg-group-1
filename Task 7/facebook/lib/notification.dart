import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationsScreen(),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {"name": "Darrell Trivedi", "time": "2 hours ago", "image": "assets/images/Avatar.png"},
    {"name": "Darrell Trivedi", "time": "2 hours ago", "image": "assets/images/Rectangle 56.png"},
    {"name": "Darrell Trivedi", "time": "2 hours ago", "image": "assets/images/Avatar (1).png"},
    {"name": "Darrell Trivedi", "time": "2 hours ago", "image": "assets/images/Rectangle 70.png"},
    {"name": "Darrell Trivedi", "time": "2 hours ago", "image": "assets/images/Rectangle 69.png"},
    {"name": "Darrell Trivedi", "time": "2 hours ago", "image": "assets/images/Rectangle 68.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // To disable the default back button
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0), // Adjust the title position
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adds space between icons
            children: [
          IconButton(
          icon: Icon(Icons.home_filled, color: Colors.blue),
          onPressed: () {
            // Navigate to the Home page when clicked
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FacebookHome()),
            );
          },
        ),
              IconButton(icon: Icon(Icons.group, color: Colors.blue), onPressed: () {}),
              IconButton(icon: Icon(Icons.person, color: Colors.blue), onPressed: () {}),
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.video_call_outlined, color: Colors.blue),
                    onPressed: () {},
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Center(
                        child: Text(
                          '9', // Notification count
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.notifications_none, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(icon: Icon(Icons.menu, color: Colors.blue), onPressed: () {}),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Notifications title and search icon
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notifications',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.search, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),

          // Notification sections
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                sectionTitle("New"),
                notificationList(highlight: true),
                SizedBox(height: 10),
                sectionTitle("Earlier"),
                notificationList(highlight: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget notificationList({bool highlight = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: highlight ? Colors.blue[50] : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: notifications.map((notification) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(notification["image"]!),
            ),
            title: Text(
              "${notification["name"]} has a new story up.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("What's your reaction?\n${notification["time"]}"),
            trailing: Icon(Icons.more_vert),
            isThreeLine: true,
          );
        }).toList(),
      ),
    );
  }
}
