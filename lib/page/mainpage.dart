import 'package:flutter/material.dart';
import 'package:quizz/page/Dashboard.dart';
import 'package:quizz/page/coursehall_2/accounting.dart';
import 'package:quizz/page/LoginPage.dart';
import 'package:quizz/page/coursehall_2/datacourse.dart';
import 'package:quizz/page/coursehall_2/englishcourse.dart';
import 'package:quizz/page/coursehall_2/investcourse.dart';
import 'package:quizz/page/coursehall_2/marketingcourse.dart';
import 'package:quizz/page/coursehall_2/officecourse.dart';
import 'package:quizz/page/enterCode.dart';

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

class MainMenu extends StatefulWidget {
  @override
  _mainMenuState createState() => _mainMenuState();
}

class _mainMenuState extends State {
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;
  bool _isVisible = false;

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  void _scrollTo(double offset) {
    _scrollController.animateTo(offset,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >= 100) {
      setState(() {
        _isVisible = true;
      });
    } else {
      setState(() {
        _isVisible = false;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: Color(0xE2F4C5),
        title: Row(
          children: [
            Container(
              child: Text(
                'UP SKILL',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        actions: [
          Builder(
            builder: (context) => Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EnterCodePage()));
                  },
                  child: Text(
                    'ENTER CODE',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.purple),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: DashboardModal(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainMenu()));
              },
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            label: 'Seacrh',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
            label: 'Favorite',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
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
                      TextButton(
                        onPressed: () {
                          _scrollTo(720);
                        },
                        child: Text("Komputer & IT"),
                      ),
                      SizedBox(width: 50),
                      TextButton(
                        onPressed: () {
                          _scrollTo(1930);
                        },
                        child: Text("English "),
                      ),
                      SizedBox(width: 50),
                      TextButton(
                        onPressed: () {
                          _scrollTo(170);
                        },
                        child: Text("COURSE"),
                      ),
                      SizedBox(width: 50),
                      TextButton(
                        onPressed: () {
                          _scrollTo(1125);
                        },
                        child: Text("Mathematics"),
                      ),
                      SizedBox(width: 50),
                      TextButton(
                        onPressed: () {
                          _scrollTo(1535);
                        },
                        child: Text("Science"),
                      ),
                      SizedBox(width: 50),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Mari Mulai Belajar",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text(
                "Pilihan Terbaik Untuk Anda",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.star_border_outlined),
                          Text(
                            'Merderka Belajar',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        onPressed: () {},
                        child: Text("SEE MORE >>",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('assets/data.jpg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Data Analysis - become great ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Become Data Analysis in 1 Month ",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nPricillia-Teacher data analysis",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DataCourse()));
                                },
                                child: Text(
                                  'Learn Here',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('assets/accounting.jpg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Accounting - learn Accounting ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Accounting for work ",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nvonnis-Accounting Teacher",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              AccountingCourse())));
                                },
                                child: Text(
                                  'Learn Here',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('assets/english.jpg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "English Course - Speak fluently ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Speak Fluently English in 1 Month",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nRegina-English Translator",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EnglishCourse()));
                                },
                                child: Text(
                                  'Learn Here',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('assets/investment.jpg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Investor - learn how to invest",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Became Rich not just dream ",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Dibuat oleh\nJack-Stock Investor",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
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
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>InvestCourse()));
                                },
                                child: Text(
                                  'Learn Here',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, left: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('assets/marketing.jpg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Marketing - market promote",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "lesson about marketting",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Dibuat oleh\ncumok-owner of jonomart",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MarketCourse()));
                                },
                                child: Text(
                                  'Learn Here',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('assets/office.jpg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Microsoft office (2024)",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Complete this course and master it",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nKelvin-workers",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
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
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> OfficeCourse()));
                                },
                                child: Text(
                                  'Learn Here',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Text(
                "Kumpulan Soal Quiz",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text(
                "Selamat datang di Quiz kami",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 50),
              //bagian Komputer dan IT

              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.star_border_outlined),
                          Text(
                            'Komputer & IT',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        onPressed: () {},
                        child: Text("SEE MORE >>",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ),
              SizedBox(height: 20),
              //tampilan kedua bagian dua
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('assets/photoshop.jpg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "PhotoShop - Photoshop Test",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Photoshop test for beginner",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nAlex-photo editor",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('assets/python.png',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Python Advance - Hero to God ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "pyhton Test for next level",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nKelvin-Python Developer",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('assets/unity.jpg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Unity for beginner Only",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Unity Beginner Test for newbie",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nmaxpotato-Game Developer",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('../assets/sql.jpeg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "SQL for working",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "SQL test for Databse master",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nVonny-TOSHIBA company",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('assets/design.jpg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Grapic Designer advance 2024",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Grapic Designer for the next level",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nJohn Muller-grapic designer",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //Mathematics
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.star_border_outlined),
                          Text(
                            'Mathematics',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        onPressed: () {},
                        child: Text("SEE MORE >>",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ),
              SizedBox(height: 20),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('../assets/algebra.jpeg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Algebra - menghitung aljabar ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Quiz aljabar untuk anak SMA ",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nRusman-Professor UI",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('../assets/linear.jpeg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Linear - Zero to God ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Linear Equation for beginner",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nalvin-USU lectture",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
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
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('../assets/ruang.jpeg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Perhitungan Bangun Ruang",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Soal Perhitungan bangun ruang ",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nRiki-Telkom lectture",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('../assets/regresi.jpeg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Perhitungan Regresi Linear",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Kumpulan Soal regresi kelas 11",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nVonny-Guru SMP Negri",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('../assets/matematikaSd.jpeg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Tes Kecerdasan Matematika",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Tes kemampuan Anak Anda",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nJohn Smith-UINSU lectture",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //science
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.star_border_outlined),
                          Text(
                            'Science',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        onPressed: () {},
                        child: Text("SEE MORE >>",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ),
              SizedBox(height: 20),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('../assets/fisika.jpeg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "FISIKA - Kumpulan Soal Fisika",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Kumpulan soal fisika kelas 12 ",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nvinal-Telkom lectture",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('../assets/biologi.jpeg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Biology Advance - Human to God ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Biology Test for UTBK",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nKelvin-Professor UI",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('../assets/suhu.jpeg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Perhitungan Suhu SMP",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Soal-Soal perhitungan Suhu kelas 7",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nmistia-science lectture",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('../assets/umumscience.jpeg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Pengetahuan Umum Sains",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "how Science works?, come and test",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nVanny-BioTech company",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('../assets/astro.jpeg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Astronomi Calculation advance",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Astronomi for the next level",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nJohn Makar-VIO Company",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //English dan Language art
              SizedBox(height: 50),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.star_border_outlined),
                          Text(
                            'English ',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        onPressed: () {},
                        child: Text("SEE MORE >>",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ),
              SizedBox(height: 20),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('../assets/englishlv1.jpeg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "English - Elementry Level",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Elementry Level Test ",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nAlexa-UI lectture",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('../assets/englishlv2.jpeg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "english Advance - Hero to God ",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "english next level Test",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nFaker-UI lectture",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('../assets/englishlv3.jpeg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "English Test for intermedite level",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Hard Level English Test",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nmax-UI lectture",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('../assets/englishlv4.jpeg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "C1 English Quiz",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "C1 English Test",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nVonna-UINSU lectture",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset('../assets/englishlv5.jpeg',
                                width: 250, height: 100, fit: BoxFit.cover),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "English Test advance 2024",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "English Test for the next level",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                "Dibuat oleh\nJohn Doe-UI lectture",
                                style: TextStyle(fontSize: 15),
                              )),
                          SizedBox(height: 10),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
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
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.only(left: 13),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Tindakan ketika tombol ditekan
                                  // Navigasi ke halaman lain
                                },
                                child: Text(
                                  'Start Quiz',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),

              SizedBox(
                height: 50,
              ),
              Image.asset('assets/Mentor.jpg'),
              //footer
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Feedback',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Subject',
                        labelStyle: TextStyle(color: Colors.purple),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                      ),
                      style: TextStyle(color: Colors.purple),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Message',
                        labelStyle: TextStyle(color: Colors.purple),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                        ),
                      ),
                      maxLines: 3,
                      style: TextStyle(color: Colors.purple),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Tindakan yang diambil ketika tombol "Kirim" ditekan
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(
                        'Kirim',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: _isVisible
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: Colors.purple,
              child: Icon(Icons.arrow_upward, color: Colors.white),
            )
          : null,
    );
  }
}
