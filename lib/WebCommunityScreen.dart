
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';




class WebCommunityScreen extends StatelessWidget {
  final List<Map<String, String>> posts = [
    {
      'user': 'Marie Kagame',
      'time': '2 hours ago',
      'message': 'Two cows were stolen from my farm last night...',
      'tag': 'RF009876543, RF009876544'
    },
    {
      'user': 'Paul Nizeyimana',
      'time': '5 hours ago',
      'message': 'TIP: Improving Milk Production...',
      'tag': 'RF009876543, RF009876544'
    },
    {
      'user': 'Jean Baptiste',
      'time': '1 day ago',
      'message': 'One of my RFID tags got damaged...',
      'tag': ''
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationPane(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(onPressed: () {}, child: Text('+ New Post')),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(post['user']!, style: TextStyle(fontWeight: FontWeight.bold)),
                                Text(post['time']!, style: TextStyle(color: Colors.grey)),
                                SizedBox(height: 8),
                                Text(post['message']!),
                                if (post['tag']!.isNotEmpty)
                                  Text("Tags: ${post['tag']}"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.thumb_up),
                                    Icon(Icons.comment),
                                    Icon(Icons.share),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SideInfoPanel(),
        ],
      ),
    );
  }
}

class NavigationPane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: Colors.blue[900],
      child: Column(
        children: [
          SizedBox(height: 30),
          Icon(Icons.dashboard, color: Colors.white),
          ListTile(leading: Icon(Icons.pets, color: Colors.white), title: Text('Livestocks', style: TextStyle(color: Colors.white))),
          ListTile(leading: Icon(Icons.qr_code_scanner, color: Colors.white), title: Text('Scan RFID', style: TextStyle(color: Colors.white))),
          ListTile(leading: Icon(Icons.report, color: Colors.white), title: Text('Reports', style: TextStyle(color: Colors.white))),
          ListTile(leading: Icon(Icons.settings, color: Colors.white), title: Text('Settings', style: TextStyle(color: Colors.white))),
          ListTile(leading: Icon(Icons.people, color: Colors.white), title: Text('Community', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}

class SideInfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            color: Colors.blue[50],
            child: ListTile(
              title: Text("📞 Emergency contacts"),
              subtitle: Text("Police: 112\nVet: +250 788 123 456\nAgri: +250 252 585 057"),
            ),
          ),
          Card(
            color: Colors.green[50],
            child: ListTile(
              title: Text("✅ System Tips"),
              subtitle: Text(
                "• Scan regularly\n• Keep tags clean\n• Update records\n• Use geofencing",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
