import 'package:flutter/material.dart';
import 'gallery.dart';
import 'notification.dart';

class FacebookHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Facebook',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.message, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Navigation Icons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(icon: Icon(Icons.home_filled, color: Colors.blue), onPressed: () {}),
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
                  Stack(
                    children: [
                      IconButton(
                        icon: Icon(Icons.notifications_none, color: Colors.blue),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NotificationsScreen()),
                          );
                        },
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
                              '3', // Notification count
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
                  IconButton(icon: Icon(Icons.menu, color: Colors.blue), onPressed: () {}),
                ],
              ),
              SizedBox(height: 20), // Space below icons

              // Input Field with Image & Search Icons
              Row(
                children: [
                  // Square Image with Border Radius from Assets
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Rounded edges
                      border: Border.all(color: Colors.grey, width: 1), // Border
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/Profile image.png', // Replace with your actual asset image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Space between image and text field

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200], // Light background
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          // Text Input
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "What's on your mind, Sanjay?",
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          // Image Icon Inside the Input Box
                          IconButton(
                            icon: Icon(Icons.image_outlined, color: Colors.blue),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Gallery()),
                              );
                            },
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Search Icon OUTSIDE the Input Box
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1), // Light blue background
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(Icons.search, color: Colors.grey, size: 22),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // Space before category buttons

              // Category Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCategoryButton("Reels", Icons.video_library, Colors.yellow, Colors.yellow[100]!),
                  _buildCategoryButton("Room", Icons.video_call, Colors.green, Colors.green[100]!),
                  _buildCategoryButton("Group", Icons.group, Colors.red, Colors.red[100]!),
                  _buildCategoryButton("Live", Icons.live_tv, Colors.blue, Colors.blue[100]!),
                ],
              ),
              SizedBox(height: 20), // Space before Stories

              // Add Facebook Stories widget here
              FacebookStories(), // Include FacebookStories widget

              SizedBox(height: 20), // Space before the post

              // Facebook Post
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User Info
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('assets/images/Ellipse.png'), // Replace with an actual image URL
                        radius: 30,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deven mestry is with Mahesh Joshi.',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('1 h . Mumbai, Maharashtra.', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Old is Gold..!! ❤️😍',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10), // Space between user info and image
                  // Post Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      'assets/images/Rectangle 29.png' ,// Replace with an actual image URL
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 10), // Space between image and text
                  // Post Text
                  Row(

                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_up_alt_outlined, color: Colors.grey),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.comment_outlined, color: Colors.grey),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.messenger_outline, color: Colors.grey),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Space before buttons
                  // Buttons Row

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.thumb_up, color: Colors.blue),
                          SizedBox(width: 0),
                          Icon(Icons.favorite, color: Colors.red),
                          // Heart icon
                          SizedBox(width: 5),
                          Text('Liked by Sachin Rambile and 109 others'),
                        ],
                      ),
                      Text('4 comments'),
                    ],
                  ),
                  SizedBox(height: 10), // Space before the new icons
                  // New Icons Row

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String title, IconData icon, Color textColor, Color backgroundColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: textColor),
          SizedBox(width: 5),
          Text(title, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}

// FacebookStories Widget
// FacebookStories Widget
// FacebookStories Widget
class FacebookStories extends StatelessWidget {
  final List<Map<String, String>> stories = [
    {
      "image": "assets/images/Profile image.png", // Background story image
      "name": "",
      "profile": "",
      "isAddStory": "true"
    },
    {
      "image": "assets/images/Rectangle 483.png",
      "name": "Vish Patil",
      "profile": "assets/images/Oval.png"
    },
    {
      "image": "assets/images/Rectangle 484.png",
      "name": "Rakesh Shetty",
      "profile": "assets/images/Person (1).png"
    },
    {
      "image": "assets/images/Rectangle 485.png",
      "name": "Akash Bolre",
      "profile": "assets/images/Oval@2x.png"
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: stories.map((story) => buildStoryCard(story)).toList(),
        ),
      ),
    );
  }

  Widget buildStoryCard(Map<String, String> story) {
    bool isAddStory = story["isAddStory"] == "true";

    return Container(
      width: 110,
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Stack(
            children: [
              // Story Image (Background)
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  story["image"]!, // Story background image from assets
                  width: 110,
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ),

              // Add Story Button (First Card Only)
              if (isAddStory)
                Positioned(
                  bottom: 5,
                  left: 35,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),

              // Profile Picture in Small Circle (For Other Stories)
              if (!isAddStory)
                Positioned(
                  bottom: 5,
                  left: 30,
                  child: Container(
                    padding: EdgeInsets.all(2), // White border effect
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                    ),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage(story["profile"]!), // Load profile image from assets
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 5),

          // Name below story (Except First Card)
          if (!isAddStory)
            Text(
              story["name"]!,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}

