import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Livestock App',
      home: ResponsiveLayout(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return MobileCommunityScreen();
        } else {
          return WebCommunityScreen(); // You can implement this later
        }
      },
    );
  }
}

// ----------------- MobileCommunityScreen ------------------

class MobileCommunityScreen extends StatelessWidget {
  final List<Map<String, String>> posts = [
    {
      'user': 'Alice',
      'time': '2 hours ago',
      'message': 'How do I keep my cows healthy during rainy season?',
      'icon': '🐄',
    },
    {
      'user': 'Bob',
      'time': '3 hours ago',
      'message': 'Check out my new goat shed! Built it myself.',
      'icon': '🐐',
    },
    {
      'user': 'Carol',
      'time': '1 day ago',
      'message': 'Anyone selling vaccinated chickens?',
      'icon': '🐓',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      body: Column(
        children: [
          // Header
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back, color: Colors.white),
                  Text("Community",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Icon(Icons.edit, color: Colors.white),
                ],
              ),
            ),
          ),

          // White content with rounded top
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.shade300,
                                child: Text(
                                  post['user']![0],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(post['user']!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 2),
                                  Text(post['time']!,
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post['icon'] ?? '',
                                  style: TextStyle(fontSize: 24)),
                              SizedBox(width: 8),
                              Expanded(child: Text(post['message']!)),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.thumb_up_alt_outlined,
                                      color: Colors.yellow.shade700),
                                  SizedBox(width: 4),
                                  Text("12"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.comment_outlined,
                                      color: Colors.blue),
                                  SizedBox(width: 4),
                                  Text("5 comment"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.share,
                                      color: Colors.grey.shade700),
                                  SizedBox(width: 4),
                                  Text("share"),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 24, height: 24),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon:
            Image.asset('assets/icons/livestock.png', width: 24, height: 24),
            label: "Livestock",
          ),
          BottomNavigationBarItem(
            icon:
            Image.asset('assets/icons/tracking.png', width: 24, height: 24),
            label: "Tracking",
          ),
          BottomNavigationBarItem(
            icon:
            Image.asset('assets/icons/settings.png', width: 24, height: 24),
            label: "Setting",
          ),
        ],
      ),
    );
  }
}

// ----------------- WebCommunityScreen (Placeholder) ------------------

class WebCommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Web Community Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
