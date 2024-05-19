import 'package:flutter/material.dart';

class HighlightedBorderIcon extends StatelessWidget {
  final IconData icon;
  final Color borderColor;
  final double size;

  const HighlightedBorderIcon({
    Key? key,
    required this.icon,
    required this.borderColor,
    this.size = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        border: Border.all(color: borderColor, width: 2.0),
      ),
      child: Icon(
        icon,
        size: size * 0.6,
        color: Colors.transparent,
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xE2F4C5),
          title: Row(
            children: [
              Image.asset(
                'assets/UPSKILL.png',
                width: 120, // Adjust the image size accordingly
                height: 190,
              ),
              SizedBox(
                width: 20, // Adding some space between the image and text
              ),
              Text(
                'Kategori',
                style: TextStyle(fontSize: 15),
              ), // Text widget for the title
            ],
          ),
          actions: [
            Builder(
              builder: (context) => Row(
                children: [
                  Container(
                    width: 700,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20, // Adding some space between the text and icon
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman "Perpustakaan saya"
                    },
                    child: Text(
                      'Perpustakaan saya',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 20, // Adding some space between the text and icon
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman "Mengajar di UPSKILL"
                    },
                    child: Text(
                      'Mengajar di UPSKILL',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 20, // Adding some space between the text and icon
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle navigation to favorite page
                    },
                    icon: Icon(Icons.favorite, color: Colors.black),
                  ),
                  SizedBox(
                    width:
                        20, // Adding some space between the icon and other icons
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle navigation to shopping cart page
                    },
                    icon: Icon(Icons.shopping_cart, color: Colors.black),
                  ),
                  SizedBox(
                    width:
                        20, // Adding some space between the icon and other icons
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle navigation to notifications page
                    },
                    icon: Icon(Icons.notifications, color: Colors.black),
                  ),
                  SizedBox(
                    width:
                        20, // Adding some space between the icon and other icons
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle navigation to profile page
                    },
                    icon: Icon(Icons.person, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xA8CD9F),
                  height: 50,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Bisnis" page
                          },
                          child: Text("Bisnis"),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Keuangan & Akuntansi" page
                          },
                          child: Text("Keuangan & Akuntansi"),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Komputer & IT" page
                          },
                          child: Text("Komputer & IT"),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Sistem Perkantoran" page
                          },
                          child: Text("Sistem Perkantoran"),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Pengembangan Diri" page
                          },
                          child: Text("Pengembangan Diri"),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Desain" page
                          },
                          child: Text("Desain"),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Marketing" page
                          },
                          child: Text("Marketing"),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Kesehatan & Fitness" page
                          },
                          child: Text("Kesehatan & Fitness"),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            // Handle navigation to "Musik" page
                          },
                          child: Text("Musik"),
                        ),
                      ],
                    ),
                  ),
                ),
                //bagian bawah dari kategori
                SizedBox(height: 10),
                Text(
                  "Mari Mulai Belajar",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Pilihan Terbaik Untuk Anda",
                  style: TextStyle(fontSize: 25),
                ),
                //body bagian 1
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align Row to start
                  children: [
                    Image.asset(
                      'assets/flutter.png',
                      width: 600,
                      height: 500,
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Flutter Dart - Zero to Hero (2024)",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Complete Course who build for beginner to Master Flutter to build native android and ios",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dibuat oleh: Alex-flutter app design",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star_border),
                              SizedBox(width: 5),
                              Text("4.0"),
                              SizedBox(width: 5),
                              Text("(6057)"),
                            ],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Tindakan ketika tombol ditekan
                              // Navigasi ke halaman lain
                            },
                            child: Text('Learn Here'),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                // tampilan kedua
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: 20), // Add margin between containers
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey), // Add border decoration
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/data.jpg',
                            width: 250,
                            height: 100,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Data Analysis - become great (2023)",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Become Data Analysis in 1Month ",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dibuat oleh: Pricillia-Teacher data analysis",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star_border),
                              Icon(Icons.star_border),
                              Icon(Icons.star_border),
                              SizedBox(width: 5),
                              Text("2.0"),
                              SizedBox(width: 5),
                              Text("(346)"),
                            ],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Tindakan ketika tombol ditekan
                              // Navigasi ke halaman lain
                            },
                            child: Text('Learn Here'),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    // tampilan ketiga
                    Container(
                      margin: EdgeInsets.only(
                          right: 20), // Add margin between containers
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey), // Add border decoration
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/english.jpg',
                            width: 250,
                            height: 100,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "English Course - Speak fluently (2024)",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Speak Fluently English in just 1 Month",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dibuat oleh: Regina-English Translator",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              SizedBox(width: 5),
                              Text("5.0"),
                              SizedBox(width: 5),
                              Text("(2357)"),
                            ],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Tindakan ketika tombol ditekan
                              // Navigasi ke halaman lain
                            },
                            child: Text('Learn Here'),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    //tampilan keempat
                    Container(
                      margin: EdgeInsets.only(
                          right: 20), // Add margin between containers
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey), // Add border decoration
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/investment.jpg',
                            width: 250,
                            height: 100,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Great Investor - learn how Warrent think",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Became Buffet not just dream anymore",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dibuat oleh: Jack-Stock Investor",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star_border),
                              SizedBox(width: 5),
                              Text("4.0"),
                              SizedBox(width: 5),
                              Text("(12357)"),
                            ],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Tindakan ketika tombol ditekan
                              // Navigasi ke halaman lain
                            },
                            child: Text('Learn Here'),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    //tampilan kelima
                    Container(
                      margin: EdgeInsets.only(
                          right: 20), // Add margin between containers
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey), // Add border decoration
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/marketing.jpg',
                            width: 250,
                            height: 100,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Simple Marketing - think like customer",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Marketing like dog,customer like dog",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dibuat oleh: cumok-owner of jonomart",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              SizedBox(width: 5),
                              Text("5.0"),
                              SizedBox(width: 5),
                              Text("(657)"),
                            ],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Tindakan ketika tombol ditekan
                              // Navigasi ke halaman lain
                            },
                            child: Text('Learn Here'),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    //tampilan keenam
                    Container(
                      margin: EdgeInsets.only(
                          right: 20), // Add margin between containers
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey), // Add border decoration
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/office.jpg',
                            width: 250,
                            height: 100,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Microsoft office (2024)",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Complete this course and master it",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dibuat oleh: Kelvin-workers",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star_border),
                              Icon(Icons.star_border),
                              SizedBox(width: 5),
                              Text("3.0"),
                              SizedBox(width: 5),
                              Text("(257)"),
                            ],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Tindakan ketika tombol ditekan
                              // Navigasi ke halaman lain
                            },
                            child: Text('Learn Here'),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                //body bagian 2

                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align Row to start
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Blender for the Beginner in (2024)",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Full Course to make 3D Blender, and make your own Animation with it",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dibuat oleh: John - 3D art designer",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star_border),
                              SizedBox(width: 5),
                              Text("4.0"),
                              SizedBox(width: 5),
                              Text("(3457)"),
                            ],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Tindakan ketika tombol ditekan
                              // Navigasi ke halaman lain
                            },
                            child: Text('Learn Here'),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 40),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/blender.jpg',
                            width: 600,
                            height: 500,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //tampilan kedua bagian dua

                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          right: 20), // Add margin between containers
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey), // Add border decoration
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/photoshop.jpg',
                            width: 250,
                            height: 100,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "PhotoShop - edit photo in photoshop",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "scare to be fat?, learn photoshop ",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dibuat oleh: Alex-photo editor",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              SizedBox(width: 5),
                              Text("5.0"),
                              SizedBox(width: 5),
                              Text("(60257)"),
                            ],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Tindakan ketika tombol ditekan
                              // Navigasi ke halaman lain
                            },
                            child: Text('Learn Here'),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    // tampilan ketiga
                    Container(
                      margin: EdgeInsets.only(
                          right: 20), // Add margin between containers
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey), // Add border decoration
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/python.png',
                            width: 250,
                            height: 100,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Python Advance - Hero to God ",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "code Python so you cannot bited by snake",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dibuat oleh: Kelvin-Python Developer",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star_border),
                              SizedBox(width: 5),
                              Text("4.0"),
                              SizedBox(width: 5),
                              Text("(6057)"),
                            ],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Tindakan ketika tombol ditekan
                              // Navigasi ke halaman lain
                            },
                            child: Text('Learn Here'),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    //tampilan keempat
                    Container(
                      margin: EdgeInsets.only(
                          right: 20), // Add margin between containers
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey), // Add border decoration
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/unity.jpg',
                            width: 250,
                            height: 100,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Unity for beginner Only",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "We will teach you Unity for beginner",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dibuat oleh: maxpotato-Game Developer",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              SizedBox(width: 5),
                              Text("5.0"),
                              SizedBox(width: 5),
                              Text("(2157)"),
                            ],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Tindakan ketika tombol ditekan
                              // Navigasi ke halaman lain
                            },
                            child: Text('Learn Here'),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    //tampilan kelima
                    Container(
                      margin: EdgeInsets.only(
                          right: 20), // Add margin between containers
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey), // Add border decoration
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/accounting.jpg',
                            width: 250,
                            height: 100,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "accounting for working",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "how accounting works?, come i teach u",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dibuat oleh: Vonny-Accountant company",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              SizedBox(width: 5),
                              Text("5.0"),
                              SizedBox(width: 5),
                              Text("(257)"),
                            ],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Tindakan ketika tombol ditekan
                              // Navigasi ke halaman lain
                            },
                            child: Text('Learn Here'),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    //tampilan keenam
                    Container(
                      margin: EdgeInsets.only(
                          right: 20), // Add margin between containers
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey), // Add border decoration
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/design.jpg',
                            width: 250,
                            height: 100,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Grapic Designer advance 2024",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Grapic Designer for the next level",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dibuat oleh: John Muller-grapic designer",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star_border),
                              Icon(Icons.star_border),
                              Icon(Icons.star_border),
                              SizedBox(width: 5),
                              Text("2.0"),
                              SizedBox(width: 5),
                              Text("(57)"),
                            ],
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Tindakan ketika tombol ditekan
                              // Navigasi ke halaman lain
                            },
                            child: Text('Learn Here'),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Image.asset('assets/Mentor.jpg'),
                //footer
                Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/UPSKILL.png',
                            width: 250,
                            height: 190,
                          ),
                          Text('Berjuang untuk mimpi')
                        ],
                      ),
                    ),
                    // spasi
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              // Tindakan yang diambil ketika tombol "Perusahaan" ditekan
                            },
                            child: Text('Perusahaan'),
                          ),
                          SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              // Tindakan yang diambil ketika tombol "Tentang Kami" ditekan
                            },
                            child: Text('Tentang Kami'),
                          ),
                          SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              // Tindakan yang diambil ketika tombol "Hubungi kami" ditekan
                            },
                            child: Text('Hubungi kami'),
                          ),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Terhubung dengan kami'),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // Tindakan yang diambil ketika tombol Facebook ditekan
                                  },
                                  icon: Icon(Icons.facebook),
                                ),
                                SizedBox(width: 20),
                                IconButton(
                                  onPressed: () {
                                    // Tindakan yang diambil ketika tombol Telegram ditekan
                                  },
                                  icon: Icon(Icons.telegram),
                                ),
                                SizedBox(width: 20),
                                IconButton(
                                  onPressed: () {
                                    // Tindakan yang diambil ketika tombol Email ditekan
                                  },
                                  icon: Icon(Icons.alternate_email),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
