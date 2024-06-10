import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class Link extends StatefulWidget {
  @override
  _LinkState createState() => _LinkState();
}

class _LinkState extends State<Link> {
  final String downloadLink = "https://UPPSKILL.com";

  void _shareLink() async {
    try {
      String message = 'Download our app using this link: $downloadLink';
      await Share.share(message);
    } catch (error) {
      print('Error sharing link: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error sharing link: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Share the download link for our app!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[900],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: downloadLink));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Download link copied to clipboard!')),
                  );
                },
                icon: Icon(Icons.copy, color: Colors.white),
                label: Text('Copy Link', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _shareLink,
                icon: Icon(Icons.share, color: Colors.white),
                label: Text('Share Link', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

