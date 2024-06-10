import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Contact Us', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Feel free to reach out to us for any inquiries or feedback:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ContactInfoItem(
              icon: Icons.email,
              label: 'Email',
              value: 'SkillUp@gmail.com',
            ),
            ContactInfoItem(
              icon: Icons.phone,
              label: 'Phone',
              value: '+081234567890',
            ),
            ContactInfoItem(
              icon: Icons.location_on,
              label: 'Address',
              value: '123 Thamrin, Jakarta, Indonesia',
            ),
            SizedBox(height: 20),
            Text(
              'Or, use the form below to send us a message:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ContactForm(),
          ],
        ),
      ),
    );
  }
}

class ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ContactInfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30.0,
            color: Colors.purple,
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                 
                ),
              ),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _message = '';
  


  void _showSuccess() {
    setState(() {
    });
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
      });
       _showSuccessDialog();
    });
   
  }

 void _showSuccessDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 4), () {
        Navigator.of(context).pop();
      }); 

      return Dialog(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl:
                    'https://www.bing.com/th/id/OGC.35f323bc5b41dc4269001529e3ff1278?pid=1.7&rurl=https%3a%2f%2fcdn.dribbble.com%2fusers%2f39201%2fscreenshots%2f3694057%2fmedia%2f2a1b062114a8244102f67deeb89395fa.gif&ehk=UKQWUom9EAuMfI5A9sAGuRTzi%2fdQT1KVKBkUf%2fajUv8%3d',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ],
          ),
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _name = value;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _email = value;
              });
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a message';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _message = value;
              });
            },
            maxLines: 5,
          ),
          SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  
                  print('Name: $_name');
                  print('Email: $_email');
                  print('Message: $_message');
                }
                _showSuccess();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: Size(200, 50),
              ),
              child: Text('SEND',style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

