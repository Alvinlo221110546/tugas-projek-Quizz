import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/page/Dashboard.dart';
import 'package:quizz/page/LoginPage.dart';
import 'package:quizz/page/coursehall_2/accounting.dart';
import 'package:quizz/page/coursehall_2/datacourse.dart';
import 'package:quizz/page/coursehall_2/englishcourse.dart';
import 'package:quizz/page/coursehall_2/investcourse.dart';
import 'package:quizz/page/coursehall_2/marketingcourse.dart';
import 'package:quizz/page/coursehall_2/officecourse.dart';
import 'package:quizz/page/enterCode.dart';
import 'package:quizz/page/favourite.dart';
import 'package:quizz/page/mainpage.dart';
import 'package:quizz/page/provider/favouriteprovider.dart';

class CourseAndQuiz extends StatefulWidget {
  @override
  _CourseAndQuizState createState() => _CourseAndQuizState();
}

class _CourseAndQuizState extends State<CourseAndQuiz> {
  TextEditingController _searchController = TextEditingController();
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
  List<Map<String, String>> _filteredItems = [];
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 1;
  bool _isVisible = false;

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
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
  void initState() {
    super.initState();
    _filteredItems = _allItems;
    _searchController.addListener(_filterItems);
    _scrollController.addListener(_scrollListener);
  }

  void _filterItems() {
    String searchTerm = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = _allItems
          .where((item) => item['title']!.toLowerCase().startsWith(searchTerm))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterItems);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _filteredItems.where((item) => item.containsKey('course')).toList();
    _filteredItems.where((item) => item.containsKey('quiz')).toList();
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CourseAndQuiz()));
              },
            ),
            label: 'Seacrh',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Favourite()));
              },
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
              SizedBox(height: 10),
              Container(
                child: Column(
                  children: [
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search Course or Quiz',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _filteredItems
                      .where((item) => item.containsKey('course'))
                      .map((item) {
                    return buildCourseCard(item);
                  }).toList(),
                ),
              ),
              SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: List.generate(
                    (_filteredItems
                                .where((item) => item.containsKey('quiz'))
                                .length /
                            5)
                        .ceil(),
                    (index) {
                      int startIndex = index * 5;
                      List<Map<String, String>> quizSubset = _filteredItems
                          .where((item) => item.containsKey('quiz'))
                          .skip(startIndex)
                          .take(5)
                          .toList();

                      return Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: quizSubset.map((item) {
                                return buildQuizCard(item);
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 50)
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
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    item['image']!,
                    width: 250,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    item['title']!,
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
                    item['subtitle']!,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Dibuat oleh\n${item['author']}',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Icon(
                          i <
                                  (double.tryParse(item['rating'] ?? '0') ?? 0)
                                      .round()
                              ? Icons.star
                              : Icons.star_border,
                          color: i <
                                  (double.tryParse(item['rating'] ?? '0') ?? 0)
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
                ),
                SizedBox(height: 20),
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
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    item['image']!,
                    width: 250,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    item['title']!,
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
                    item['subtitle']!,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Dibuat oleh\n${item['author']}',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        Icon(
                          i <
                                  (double.tryParse(item['rating'] ?? '0') ?? 0)
                                      .round()
                              ? Icons.star
                              : Icons.star_border,
                          color: i <
                                  (double.tryParse(item['rating'] ?? '0') ?? 0)
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       switch (item['quiz']) {
                        //         case 'DataCourse':
                        //           return DataCourse();
                        //         case 'AccountingCourse':
                        //           return AccountingCourse();
                        //         case 'EnglishCourse':
                        //           return EnglishCourse();
                        //         case 'InvestCourse':
                        //           return InvestCourse();
                        //         case 'MarketCourse':
                        //           return MarketCourse();
                        //         case 'OfficeCourse':
                        //           return OfficeCourse();
                        //         default:
                        //           return Container();
                        //       }
                        //     },
                        //   ),
                        // );
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
                SizedBox(height: 20),
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
}

void _showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: 2), 
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
