import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/page/courseandquiz.dart';
import 'package:quizz/page/coursehall_2/accounting.dart';
import 'package:quizz/page/Dasboard.dart';
import 'package:quizz/page/LoginPage.dart';
import 'package:quizz/page/coursehall_2/datacourse.dart';
import 'package:quizz/page/coursehall_2/englishcourse.dart';
import 'package:quizz/page/coursehall_2/investcourse.dart';
import 'package:quizz/page/coursehall_2/marketingcourse.dart';
import 'package:quizz/page/coursehall_2/officecourse.dart';
import 'package:quizz/page/enterCode.dart';
import 'package:quizz/page/favourite.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:quizz/page/provider/favouriteprovider.dart';
import 'package:quizz/page/provider/providerUser.dart';
import 'package:quizz/page/register_page.dart';
import 'package:quizz/page/quiz_page.dart';

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
  List<Map<String, String>> _allItems = [
    {
      'title': 'Data Analysis - become great',
      'subtitle': 'Become Data Analysis in 1 Month',
      'author': 'Pricillia-Teacher data analysis',
      'image': 'assets/data.jpg',
      'rating': '2.0',
      'reviews': '(346)',
      'course': 'DataCourse'
    },
    {
      'title': 'Accounting - learn Accounting',
      'subtitle': 'Accounting for work',
      'author': 'vonnis-Accounting Teacher',
      'image': 'assets/accounting.jpg',
      'rating': '2.0',
      'reviews': '(346)',
      'course': 'AccountingCourse'
    },
    {
      'title': 'English Course - Speak fluently',
      'subtitle': 'Speak Fluently English in 1 Month',
      'author': 'Regina-English Translator',
      'image': 'assets/english.jpg',
      'rating': '5.0',
      'reviews': '(2357)',
      'course': 'EnglishCourse'
    },
    {
      'title': 'Investor - learn how to invest',
      'subtitle': 'Became Rich not just dream',
      'author': 'Jack-Stock Investor',
      'image': 'assets/investment.jpg',
      'rating': '4.0',
      'reviews': '(12357)',
      'course': 'InvestCourse'
    },
    {
      'title': 'Marketing - market promote',
      'subtitle': 'lesson about marketting',
      'author': 'cumok-owner of jonomart',
      'image': 'assets/marketing.jpg',
      'rating': '5.0',
      'reviews': '(657)',
      'course': 'MarketCourse'
    },
    {
      'title': 'Microsoft office (2024)',
      'subtitle': 'Complete this course ',
      'author': 'Kelvin-workers',
      'image': 'assets/office.jpg',
      'rating': '3.0',
      'reviews': '(257)',
      'course': 'OfficeCourse'
    },
    {
      'title': 'PhotoShop - Photoshop Test',
      'subtitle': 'Photoshop test for beginner',
      'author': 'Alex-photo editor',
      'image': 'assets/photoshop.jpg',
      'rating': '5.0',
      'reviews': '(60257)',
      'quiz': 'Photoshopquiz'
    },
    {
      'title': 'Python Advance - Hero to God',
      'subtitle': 'pyhton Test for next level',
      'author': 'Kelvin-Python Developer',
      'image': 'assets/python.png',
      'rating': '4.0',
      'reviews': '(60257)',
      'quiz': 'Phytonquiz'
    },
    {
      'title': 'Unity for beginner Only',
      'subtitle': 'Unity Beginner Test for newbie',
      'author': 'maxpotato-Game Developer',
      'image': 'assets/unity.jpg',
      'rating': '5.0',
      'reviews': '(2157)',
      'quiz': 'Unityquiz'
    },
    {
      'title': 'SQL for working',
      'subtitle': 'SQL test for Databse master',
      'author': 'Vonny-TOSHIBA company',
      'image': '../assets/sql.jpeg',
      'rating': '5.0',
      'reviews': '(257)',
      'quiz': 'Sqlquiz'
    },
    {
      'title': 'Grapic Designer advance 2024',
      'subtitle': 'Grapic Designer for the next level',
      'author': 'John Muller-grapic designer',
      'image': 'assets/design.jpg',
      'rating': '2.0',
      'reviews': '(57)',
      'quiz': 'Grapicquiz'
    },
    {
      'title': 'Algebra - menghitung aljabar',
      'subtitle': 'Quiz aljabar untuk anak SMA',
      'author': 'Rusman-Professor UI',
      'image': '../assets/algebra.jpeg',
      'rating': '5.0',
      'reviews': '(60257)',
      'quiz': 'Algebraquiz'
    },
    {
      'title': 'Linear - Zero to God',
      'subtitle': 'Linear Equation for beginner',
      'author': 'alvin-USU lectture',
      'image': '../assets/linear.jpeg',
      'rating': '4.0',
      'reviews': '(6057)',
      'quiz': 'Linearquiz'
    },
    {
      'title': 'Perhitungan Bangun Ruang',
      'subtitle': 'Soal Perhitungan bangun ruang',
      'author': 'Riki-Telkom lectture',
      'image': '../assets/ruang.jpeg',
      'rating': '5.0',
      'reviews': '(2157)',
      'quiz': 'Ruangquiz'
    },
    {
      'title': 'Perhitungan Regresi Linear',
      'subtitle': 'Kumpulan Soal regresi kelas 11',
      'author': 'Vonny-Guru SMP Negri',
      'image': '../assets/regresi.jpeg',
      'rating': '5.0',
      'reviews': '(257)',
      'quiz': 'Regresiquiz'
    },
    {
      'title': 'Tes Kecerdasan Matematika',
      'subtitle': 'Tes kemampuan Anak Anda',
      'author': 'John Smith-UINSU lectture',
      'image': '../assets/matematikaSd.jpeg',
      'rating': '2.0',
      'reviews': '(57)',
      'quiz': 'Kecerdasanquiz'
    },
    {
      'title': 'FISIKA - Kumpulan Soal Fisika',
      'subtitle': 'Kumpulan soal fisika kelas 12',
      'author': 'vinal-Telkom lectture',
      'image': '../assets/fisika.jpeg',
      'rating': '5.0',
      'reviews': '(60257)',
      'quiz': 'fisikaquiz'
    },
    {
      'title': 'Biology Advance - Human to God',
      'subtitle': 'Biology Test for UTBK',
      'author': 'Kelvin-Professor UI',
      'image': '../assets/biologi.jpeg',
      'rating': '4.0',
      'reviews': '(6057)',
      'quiz': 'Biologyquiz'
    },
    {
      'title': 'Perhitungan Suhu SMP',
      'subtitle': 'Soal-Soal perhitungan Suhu kelas 7',
      'author': 'mistia-science lectture',
      'image': '../assets/suhu.jpeg',
      'rating': '5.0',
      'reviews': '(2157)',
      'quiz': 'Suhuquiz'
    },
    {
      'title': 'Pengetahuan Umum Sains',
      'subtitle': 'how Science works?, come and test',
      'author': 'Vanny-BioTech company',
      'image': '../assets/umumscience.jpeg',
      'rating': '5.0',
      'reviews': '(257)',
      'quiz': 'Sainsquiz'
    },
    {
      'title': 'Astronomi Calculation advance',
      'subtitle': 'Astronomi for the next level',
      'author': 'John Makar-VIO Company',
      'image': '../assets/astro.jpeg',
      'rating': '2.0',
      'reviews': '(57)',
      'quiz': 'Astronomiquiz'
    },
    {
      'title': 'English - Elementry Level',
      'subtitle': 'Elementry Level Test',
      'author': 'Alexa-UI lectture',
      'image': '../assets/englishlv1.jpeg',
      'rating': '5.0',
      'reviews': '(60257)',
      'quiz': 'Elementryquiz'
    },
    {
      'title': 'english Advance - Hero to God',
      'subtitle': 'english next level Test',
      'author': 'Faker-UI lectture',
      'image': '../assets/englishlv2.jpeg',
      'rating': '4.0',
      'reviews': '(6057)',
      'quiz': 'advancequiz'
    },
    {
      'title': 'English Test for intermedite level',
      'subtitle': 'Hard Level English Test',
      'author': 'max-UI lectture',
      'image': '../assets/englishlv3.jpeg',
      'rating': '5.0',
      'reviews': '(2157)',
      'quiz': 'hardquiz'
    },
    {
      'title': 'C1 English Quiz',
      'subtitle': 'C1 English Test',
      'author': 'Vonna-UINSU lectture',
      'image': '../assets/englishlv4.jpeg',
      'rating': '5.0',
      'reviews': '(257)',
      'quiz': 'C1quiz'
    },
    {
      'title': 'English Test advance 2024',
      'subtitle': 'English Test for the next level',
      'author': 'John Doe-UI lectture',
      'image': '../assets/englishlv5.jpeg',
      'rating': '2.0',
      'reviews': '(57)',
      'quiz': 'nextlvlquiz'
    }
  ];
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;
  bool _isVisible = false;
  bool _showBanner = true;

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

  void _showSuccess() {
    setState(() {});
    Future.delayed(Duration(seconds: 1), () {
      setState(() {});
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
    final profileProvider = Provider.of<ProfileProvider>(context);
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
            icon: Tooltip(
              message: 'Home',
              child: IconButton(
                icon: Icon(Icons.home),
                iconSize: 30,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainMenu()));
                },
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Search',
              child: IconButton(
                icon: Icon(Icons.search),
                iconSize: 30,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CourseAndQuiz()));
                },
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Tooltip(
              message: 'Favorite',
              child: IconButton(
                icon: Icon(Icons.favorite),
                iconSize: 30,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Favourite()));
                },
              ),
            ),
            label: '',
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
              if (profileProvider.account.isEmpty && _showBanner)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: MaterialBanner(
                    content: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'It looks like you don’t have an account yet. Sign in to unlock more features, or continue as a guest.',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterPage()));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _showBanner = false;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Text(
                                    'Continue as Guest',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    actions: [Container()],
                  ),
                ),
              Container(
                color: Color(0xA8CD9F),
                height: 50,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          _scrollTo(810);
                        },
                        child: Text("Komputer & IT"),
                      ),
                      SizedBox(width: 50),
                      TextButton(
                        onPressed: () {
                          _scrollTo(2100);
                        },
                        child: Text("English "),
                      ),
                      SizedBox(width: 50),
                      TextButton(
                        onPressed: () {
                          _scrollTo(298);
                        },
                        child: Text("COURSE"),
                      ),
                      SizedBox(width: 50),
                      TextButton(
                        onPressed: () {
                          _scrollTo(1245);
                        },
                        child: Text("Mathematics"),
                      ),
                      SizedBox(width: 50),
                      TextButton(
                        onPressed: () {
                          _scrollTo(1665);
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CourseAndQuiz()));
                        },
                        child: Text("SEE MORE >>",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _allItems
                      .where((item) => item.containsKey('course'))
                      .map((item) {
                    return buildCourseCard(item);
                  }).toList(),
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CourseAndQuiz()));
                        },
                        child: Text("SEE MORE >>",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ),
              SizedBox(height: 20),
              //tampilan kedua bagian dua
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _allItems
                            .where((item) => item.containsKey('quiz'))
                            .take(5)
                            .map((item) {
                          return buildQuizCard(item);
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 30),
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CourseAndQuiz()));
                        },
                        child: Text("SEE MORE >>",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ),
              SizedBox(height: 20),

              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _allItems
                            .where((item) => item.containsKey('quiz'))
                            .skip(5)
                            .take(5)
                            .map((item) {
                          return buildQuizCard(item);
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 30),
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CourseAndQuiz()));
                        },
                        child: Text("SEE MORE >>",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ),
              SizedBox(height: 20),

              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _allItems
                            .where((item) => item.containsKey('quiz'))
                            .skip(10)
                            .take(5)
                            .map((item) {
                          return buildQuizCard(item);
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 30),
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CourseAndQuiz()));
                        },
                        child: Text("SEE MORE >>",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ),
              SizedBox(height: 20),

              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _allItems
                            .where((item) => item.containsKey('quiz'))
                            .skip(15)
                            .take(5)
                            .map((item) {
                          return buildQuizCard(item);
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),

              CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: true,
                ),
                items: [
                  'assets/Mentor.jpg',
                  'assets/learn.jpeg',
                  'assets/learn2.jpeg',
                  'assets/learn3.jpeg',
                  'assets/learn4.jpeg',
                  'assets/learn5.jpeg',
                ].map((assetPath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                        ),
                        child: Image.asset(
                          assetPath,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              SizedBox(
                height: 50,
              ),

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
                        _showSuccess();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: Text(
                        'SEND',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
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

  Widget buildCourseCard(Map<String, String> item) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.only(right: 20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: const Color.fromARGB(255, 145, 143, 143))),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                  child: Image.asset(
                    item['image']!,
                    width: 250,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        item['subtitle']!,
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Dibuat oleh\n${item['author']}',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Icon(
                              i <
                                      (double.tryParse(item['rating'] ?? '0') ??
                                              0)
                                          .round()
                                  ? Icons.star
                                  : Icons.star_border,
                              color: i <
                                      (double.tryParse(item['rating'] ?? '0') ??
                                              0)
                                          .round()
                                  ? Colors.yellow
                                  : Colors.black,
                            ),
                          SizedBox(width: 5),
                          Text(item['rating'] ?? '0'),
                          SizedBox(width: 5),
                          Text(item['reviews'] ?? '0'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  switch (item['course']) {
                                    case 'DataCourse':
                                      return DataCourse();
                                    case 'AccountingCourse':
                                      return AccountingCourse();
                                    case 'EnglishCourse':
                                      return EnglishCourse();
                                    case 'InvestCourse':
                                      return InvestCourse();
                                    case 'MarketCourse':
                                      return MarketCourse();
                                    case 'OfficeCourse':
                                      return OfficeCourse();
                                    default:
                                      return Container();
                                  }
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Learn Here',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Consumer<FavoriteModel>(
                builder: (context, favoriteModel, child) {
                  final isFavorite = favoriteModel.isFavorite(item['title']!);
                  return IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite
                          ? const Color.fromARGB(255, 255, 17, 0)
                          : Colors.white,
                    ),
                    onPressed: () {
                      if (!isFavorite) {
                        favoriteModel.toggleFavorite(item);
                        _showSnackBar(context, "Added to Favorites!");
                      } else {
                        favoriteModel.toggleFavorite(item);
                        _showSnackBar(context, "Removed from Favorites!");
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuizCard(Map<String, String> item) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.only(right: 20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: const Color.fromARGB(255, 145, 143, 143))),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                  child: Image.asset(
                    item['image']!,
                    width: 250,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        item['subtitle']!,
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Dibuat oleh\n${item['author']}',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Icon(
                              i <
                                      (double.tryParse(item['rating'] ?? '0') ??
                                              0)
                                          .round()
                                  ? Icons.star
                                  : Icons.star_border,
                              color: i <
                                      (double.tryParse(item['rating'] ?? '0') ??
                                              0)
                                          .round()
                                  ? Colors.yellow
                                  : Colors.black,
                            ),
                          SizedBox(width: 5),
                          Text(item['rating'] ?? '0'),
                          SizedBox(width: 5),
                          Text(item['reviews'] ?? '0'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuizPage(
                                        item['quiz']!, item['title']!)));
                          },
                          child: Text(
                            'Start Quiz',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Consumer<FavoriteModel>(
                builder: (context, favoriteModel, child) {
                  final isFavorite = favoriteModel.isFavorite(item['title']!);
                  return IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite
                          ? const Color.fromARGB(255, 255, 17, 0)
                          : Colors.white,
                    ),
                    onPressed: () {
                      if (!isFavorite) {
                        favoriteModel.toggleFavorite(item);
                        _showSnackBar(context, "Added to Favorites!");
                      } else {
                        favoriteModel.toggleFavorite(item);
                        _showSnackBar(context, "Removed from Favorites!");
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
