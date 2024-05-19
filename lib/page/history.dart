import 'package:flutter/material.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'History :',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            HistoryInfoItem(
              icon: Icons.onetwothree,
              label: 'Linear - Zero to God',
              value: '18 April 2024',
            ),
            HistoryInfoItem(
              icon: Icons.onetwothree,
              label: 'Perhitungan Bangun Ruang',
              value: '15 April 2024',
            ),
            HistoryInfoItem(
              icon: Icons.science,
              label: 'Biology Advance - Human to God',
              value: '12 April 2024',
            ),
            HistoryInfoItem(
              icon: Icons.book,
              label: 'English - Elementry Level',
              value: '11 April 2024',
            ),
            HistoryInfoItem(
              icon: Icons.science,
              label: 'Pengetahuan Umum Science',
              value: '11 April 2024',
            ),
            HistoryInfoItem(
              icon: Icons.book,
              label: 'C1 English Quiz',
              value: '1 April 2024',
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
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
                  color: Colors.black,
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
