import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:quizz/page/Mainmenu.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool _isLoadingComplete = false;
  bool _showError = false;

  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 4));
    // throw Exception("Simulated error"); // Uncomment ini untuk simulasi error
    setState(() {
      _isLoadingComplete = true;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      _loadData().then((_) {
        if (_isLoadingComplete) {
          Future.delayed(Duration(milliseconds: 2000), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainMenu()),
            );
          });
        }
      }).catchError((error) {
        setState(() {
          _showError = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Container(
              alignment: Alignment.center,
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'UPP SKILL',
                    textStyle: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            
            AnimatedSwitcher(
              duration: Duration(seconds: 1), 
              child: _isLoadingComplete
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 50.0,
                      key: UniqueKey(),
                    )
                  : CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      key: UniqueKey(),
                    ),
            ),
            SizedBox(height: 20),
            
            Container(
              alignment: Alignment.center,
              child: Text(
                _isLoadingComplete ? 'Loading Complete!' : 'Loading...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_showError)
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: _showError ? 50 : 0,
                height: _showError ? 50 : 0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            SizedBox(height: 10),
            if (_showError)
              Text(
                'There is a problem. Please try again later.',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
