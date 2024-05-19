import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/page/Mainmenu.dart';
import 'package:quizz/page/changepassword.dart';
import 'package:quizz/page/provider/providerUser.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: MaterialApp(
        title: 'Profile Page',
        home: ProfilePage(),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController fullName;
  late TextEditingController phone;
  late TextEditingController status;

  @override
  void initState() {
    super.initState();
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    fullName = TextEditingController(text: profileProvider.account.isNotEmpty ? profileProvider.account[0].fullName : '');
    phone = TextEditingController(text: profileProvider.account.isNotEmpty ? profileProvider.account[0].phone : '');
    status = TextEditingController(text: profileProvider.account.isNotEmpty ? profileProvider.account[0].status : '');
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    String profilePictureUrl = profileProvider.account.isNotEmpty ? profileProvider.account[0].profilePictureUrl : '../assets/profile.png';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.purple[200],
                    backgroundImage: AssetImage(profilePictureUrl),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: FloatingActionButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Pilih Foto'),
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                            content: Text('Tambahkan foto dari galeri atau ambil foto baru?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  // Logic to pick image from gallery
                                },
                                child: Text('Galeri'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Logic to pick image from camera
                                },
                                child: Text('Camera'),
                              ),
                            ],
                          ),
                        );
                      },
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'My Profile',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple[800],
              ),
            ),
            SizedBox(height: 20.0),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: fullName,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your Username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: phone,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your Phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Status:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[800],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    profileProvider.account.isNotEmpty ? profileProvider.account[0].status : 'No status available',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  TextFormField(
                    controller: status,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: 'Update Status',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter your Status';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 32.0),
                
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                      );
                    },
                    child: Text(
                      'Change Password',
                      style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 100,)
                  
                ],
              ),
            ),
          ],
          
        ),
        
      ),
    
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            setState(() {
              profileProvider.changeFullName(0, fullName.text);
              profileProvider.changePhone(0, phone.text);
              profileProvider.changeStatus(0, status.text);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainMenu()));
            });
          }
        },
        label: Text('SAVE', style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.save, color: Colors.white),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
