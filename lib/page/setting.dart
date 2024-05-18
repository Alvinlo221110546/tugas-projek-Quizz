import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/provider/DarkmodeProvider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isSoundEnabled = true;
  bool _areNotificationsEnabled = false;
  String _selectedLanguage = 'Indonesia';
  bool _accessPhotos = true;
  bool _accessCamera = false;
  bool _accessContacts = false;
  bool _accessNotifications = false;

  void _toggleSound(bool value) {
    setState(() {
      _isSoundEnabled = value;
    });
  }

  void _toggleNotifications(bool? value) {
    if (value != null) {
      setState(() {
        _areNotificationsEnabled = value;
      });
    }
  }



  void _changeLanguage(String? language) {
    if (language != null) {
      setState(() {
        _selectedLanguage = language;
      });
    }
  }

  void _toggleAccessLocation(bool? value) {
    if (value != null) {
      setState(() {
        _accessPhotos = value;
      });
    }
  }

  void _toggleAccessCamera(bool? value) {
    if (value != null) {
      setState(() {
        _accessCamera = value;
      });
    }
  }

  void _toggleAccessContacts(bool? value) {
    if (value != null) {
      setState(() {
        _accessContacts = value;
      });
    }
  }

  void _toggleAccessNotifications(bool? value) {
    if (value != null) {
      setState(() {
        _accessNotifications = value;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
  final prov = Provider.of<darkModeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Settings', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Toggle',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Sound',
                  ),
                  Switch(
                    value: _isSoundEnabled,
                    onChanged: _toggleSound,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Dark Mode',
                  ),
                  Switch(
                    value: prov.enableDarkMode,
                    onChanged: (val){
                      prov.setBrightness = val;
                    },
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 27,),
              Text(
                'Single Check',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Allow notifications'),
                      Radio(
                        value: true,
                        groupValue: _areNotificationsEnabled,
                        onChanged: _toggleNotifications,
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Turn Off notifications'),
                      Radio(
                        value: false,
                        groupValue: _areNotificationsEnabled,
                        onChanged: _toggleNotifications,
                      ),
                    ],
                  )
                ],
              ),
              Divider(),
              SizedBox(height: 27,),
              ListTile(
                title: Text('Language'),
                subtitle: Text(_selectedLanguage),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Select Language'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              title: Text('Indonesia'),
                              onTap: () {
                                _changeLanguage('Indonesia');
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Text('English'),
                              onTap: () {
                                _changeLanguage('English');
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              Divider(),
              SizedBox(height: 27,),
              Text(
                'Multiple Check',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CheckboxListTile(
                title: Text('Access Location'),
                value: _accessPhotos,
                onChanged: _toggleAccessLocation,
              ),
              CheckboxListTile(
                title: Text('Access Camera'),
                value: _accessCamera,
                onChanged: _toggleAccessCamera,
              ),
              CheckboxListTile(
                title: Text('Access Contacts'),
                value: _accessContacts,
                onChanged: _toggleAccessContacts,
              ),
              CheckboxListTile(
                title: Text('Access Notifications'),
                value: _accessNotifications,
                onChanged: _toggleAccessNotifications,
              ),
              SizedBox(height: 27,),
            ],
          ),
        ),
      ),
    );
  }
}
