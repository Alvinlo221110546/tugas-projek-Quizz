<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/page/provider/providerScore.dart';

class QuizHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Quiz History', style: TextStyle(color: Colors.white)),
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
                  'History:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                _buildHistoryList(scoreProvider),
                SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHistoryList(ScoreProvider scoreProvider) {
    List<Widget> historyItems = [];

    for (var history in scoreProvider.history) {
      historyItems.add(
        HistoryInfoItem(
          icon: Icons.book, // Anda bisa mengganti ikon sesuai kebutuhan
          label: history['quizType']!,
          value: history['date']!,
        ),
      );
    }

    if (historyItems.isEmpty) {
      historyItems.add(
        HistoryInfoItem(
          icon: Icons.not_interested,
          label: 'No Quiz Were Made',
          value: '',
        ),
      );
    }

    return Column(children: historyItems);
  }
}

class HistoryInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const HistoryInfoItem({
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
=======
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/page/provider/providerScore.dart';

class QuizHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Quiz History', style: TextStyle(color: Colors.white)),
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
                  'History:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                _buildHistoryList(scoreProvider),
                SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHistoryList(ScoreProvider scoreProvider) {
    List<Widget> historyItems = [];

    for (var history in scoreProvider.history) {
      historyItems.add(
        HistoryInfoItem(
          icon: Icons.book, // Anda bisa mengganti ikon sesuai kebutuhan
          label: history['quizType']!,
          value: history['date']!,
        ),
      );
    }

    if (historyItems.isEmpty) {
      historyItems.add(
        HistoryInfoItem(
          icon: Icons.not_interested,
          label: 'No Quiz Were Made',
          value: '',
        ),
      );
    }

    return Column(children: historyItems);
  }
}

class HistoryInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const HistoryInfoItem({
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
>>>>>>> d0f56fe0e33fd7cc0fb15a3ee674d13aa97ba9e8
