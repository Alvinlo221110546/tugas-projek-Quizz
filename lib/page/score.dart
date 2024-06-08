import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/page/provider/providerScore.dart';

class Score extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Quiz Score', style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Consumer<ScoreProvider>(
          builder: (context, scoreProvider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Scores:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                _buildScoreList(scoreProvider),
                SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildScoreList(ScoreProvider scoreProvider) {
    List<Widget> scoreItems = [];

    scoreProvider.scores.forEach((quizType, score) {
      scoreItems.add(
        ScoreInfoItem(
          icon: Icons.book, // Anda bisa mengganti ikon sesuai kebutuhan
          label: quizType,
          value: (score * 100).toString() + ' / 100',
        ),
      );
    });

    if (scoreItems.isEmpty) {
      scoreItems.add(
        ScoreInfoItem(
          icon: Icons.not_interested,
          label: 'No Quiz Were Made',
          value: '',
        ),
      );
    }

    return Column(children: scoreItems);
  }
}

class ScoreInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ScoreInfoItem({
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
