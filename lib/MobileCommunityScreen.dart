
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';




class MobileCommunityScreen extends StatelessWidget {
  final List<Map<String, String>> posts = [
    {
      'user': 'Marie Kagame',
      'time': '2 hours ago',
      'message': 'Great news! My cow Luna just gave birth...',
      'icon': '🐄'
    },
    {
      'user': 'Maire Claire',
      'time': '4 hours ago',
      'message': 'ALERT: 2 cows stolen from Nyanza...',
      'icon': '🚨'
    },
    {
      'user': 'Dr. Samuel (Veterinarian)',
      'time': '6 hours ago',
      'message': 'TIP: Remember to vaccinate your cattle...',
      'icon': '💡'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Community")),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Livestock"),
          BottomNavigationBarItem(icon: Icon(Icons.track_changes), label: "Tracking"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post['user']!, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(post['time']!, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 8),
                  Text(post['message']!),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.thumb_up_alt_outlined),
                      Icon(Icons.comment_outlined),
                      Icon(Icons.share),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
