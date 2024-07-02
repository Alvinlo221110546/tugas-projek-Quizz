import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/page/Dasboard.dart';
import 'package:quizz/page/LoginPage.dart';
import 'package:quizz/page/Mainmenu.dart';
import 'package:quizz/page/courseandquiz.dart';
import 'package:quizz/page/coursehall_2/accounting.dart';
import 'package:quizz/page/coursehall_2/datacourse.dart';
import 'package:quizz/page/coursehall_2/englishcourse.dart';
import 'package:quizz/page/coursehall_2/investcourse.dart';
import 'package:quizz/page/coursehall_2/marketingcourse.dart';
import 'package:quizz/page/coursehall_2/officecourse.dart';
import 'package:quizz/page/enterCode.dart';
import 'package:quizz/page/provider/favouriteprovider.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  int _selectedIndex = 1;

  final DataNavigate = [MainMenu(), Favourite(), CourseAndQuiz()];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DataNavigate[index]));
    setState(() {});
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.purple,
                  ),
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
      body: Consumer<FavoriteModel>(
        builder: (context, favoriteModel, child) {
          final favorites = favoriteModel.favorites.toList();
          if (favorites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                    size: 100,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'No Favorites Yet',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Browse and add items to your favorites',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CourseAndQuiz()),
                      );
                    },
                    child: Text(
                      'Explore ',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                if (favorites[index]['quiz'] != null) {
                  return buildFavoriteCardQuiz(favorites[index]);
                } else if (favorites[index]['course'] != null) {
                  return buildFavoriteCardCourse(favorites[index]);
                } else {
                  return SizedBox();
                }
              },
            );
          }
        },
      ),
      drawer: DashboardModal(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Tooltip(
                message: 'Home',
                child: Icon(
                  Icons.home,
                  size: 30,
                )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Tooltip(
                message: 'Favorite',
                child: Icon(
                  Icons.favorite,
                  size: 30,
                )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Tooltip(
                message: 'Search',
                child: Icon(
                  Icons.search,
                  size: 30,
                )),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildFavoriteCardQuiz(Map<String, String> item) {
    return Container(
      margin: EdgeInsets.all(10),
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              item['image']!,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              item['title']!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              item['subtitle']!,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Dibuat oleh\n${item['author']}',
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Icon(
                    i < (double.tryParse(item['rating'] ?? '0') ?? 0).round()
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
            padding: const EdgeInsets.only(left: 13),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                onPressed: () {},
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
            height: 20,
          )
        ],
      ),
    );
  }

  Widget buildFavoriteCardCourse(Map<String, String> item) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              item['image']!,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              item['title']!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              item['subtitle']!,
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Dibuat oleh\n${item['author']}',
              style: TextStyle(fontSize: 15),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Icon(
                    i < (double.tryParse(item['rating'] ?? '0') ?? 0).round()
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
