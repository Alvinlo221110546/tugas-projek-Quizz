import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quizz/page/Mainmenu.dart';
import 'package:quizz/page/camera.dart';
import 'package:quizz/page/changepassword.dart';
import 'package:quizz/page/provider/providerUser.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController fullName;
  late TextEditingController phone;
  late TextEditingController birthDate;
  late TextEditingController status;
  File? _imageFile;
  late CameraController? _controller;

  @override
  void initState() {
    super.initState();
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    fullName = TextEditingController(text: profileProvider.account.isNotEmpty ? profileProvider.account[0].fullName : '');
    phone = TextEditingController(text: profileProvider.account.isNotEmpty ? profileProvider.account[0].phone : '');
    birthDate = TextEditingController(text: profileProvider.account.isNotEmpty ? profileProvider.account[0].birthDate : '');
    status = TextEditingController(text: profileProvider.account.isNotEmpty ? profileProvider.account[0].status : '');
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        final bytes = await pickedImage.readAsBytes();
        final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
        profileProvider.changeProfilePicture(0, bytes);
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        birthDate.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    fullName.dispose();
    phone.dispose();
    birthDate.dispose();
    status.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
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
                    backgroundImage: profileProvider.account.isNotEmpty
                        ? profileProvider.account[0].profilePicture != null
                            ? MemoryImage(profileProvider.account[0].profilePicture!)
                            : null
                        : null,
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
                              ],
                            ),
                            content: Text('Tambahkan foto dari galeri atau ambil foto baru?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  _pickImage(ImageSource.gallery);
                                },
                                child: Text('Galeri'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen()));
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
                  ),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      _selectDate(context);
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: birthDate,
                        decoration: InputDecoration(
                          labelText: 'Birth Date',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          prefixIcon: Icon(Icons.calendar_today),
                        ),
                      ),
                    ),
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
                      style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 100),
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
              profileProvider.changeBirthDate(0, birthDate.text);
              profileProvider.changeStatus(0, status.text);
              final imageBytes = _imageFile != null ? _imageFile!.readAsBytesSync() : profileProvider.account[0].profilePicture;
              if (imageBytes != null) {
                profileProvider.changeProfilePicture(0, imageBytes);
              } else {
                print('Error: imageBytes is null');
              }
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
