import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/page/LoginPage.dart';
import 'package:quizz/page/contactus.dart';
import 'package:quizz/page/courseandquiz.dart';
import 'package:quizz/page/help.dart';
import 'package:quizz/page/history.dart';
import 'package:quizz/page/profile_page.dart';
import 'package:quizz/page/provider/providerUser.dart';
import 'package:quizz/page/score.dart';
import 'package:quizz/page/setting.dart';
import 'package:quizz/page/about_us.dart';

class DashboardModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    String username = profileProvider.account.isNotEmpty
        ? profileProvider.account[0].fullName
        : '';
    String email = profileProvider.account.isNotEmpty
        ? profileProvider.account[0].email
        : '';

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dashboard',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.purple[200],
                        backgroundImage: profileProvider.account.isNotEmpty
                            ? profileProvider.account[0].profilePicture != null
                                ? MemoryImage(
                                    profileProvider.account[0].profilePicture!)
                                : null
                            : null,
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              username,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              email,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(' Profile'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.score),
            title: Text('Score'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Score()));
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Courses & Quizzes'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CourseAndQuiz()));
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Quiz History'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QuizHistory()));
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_phone),
            title: Text('Contact'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HelpPage()));
            },
          ),
          // Tambahkan opsi "About Us"
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AboutUs()));
            },
          ),
          // Tombol logout
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}
